import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _formKey = GlobalKey<FormState>();
  final _guestNameController = TextEditingController();
  final _emailController = TextEditingController();

  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  String? _dateError;

  double _adults = 2;
  double _children = 0;

  final Map<String, bool> _extras = {
    'Breakfast': false,
    'Airport Pickup': false,
    'Spa Access': false,
  };

  String _roomView = 'City View';

  @override
  void dispose() {
    _guestNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isCheckIn}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn
          ? (_checkInDate ?? now)
          : (_checkOutDate ??
                (_checkInDate ?? now).add(const Duration(days: 1))),
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
        } else {
          _checkOutDate = picked;
        }
        _dateError = null;
      });
    }
  }

  String _formatDate(DateTime? date, String placeholder) {
    if (date == null) return placeholder;
    return '${date.day}/${date.month}/${date.year}';
  }

  void _submitBooking() {
    final isFormValid = _formKey.currentState!.validate();
    String? dateErr;

    if (_checkInDate == null || _checkOutDate == null) {
      dateErr = 'Please select check-in and check-out dates';
    } else if (!_checkOutDate!.isAfter(_checkInDate!)) {
      dateErr = 'Check-out must be after check-in';
    }

    setState(() => _dateError = dateErr);

    if (isFormValid && dateErr == null) {
      Navigator.pushNamed(context, '/rooms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Your Stay')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Stylized Hero Banner (No external image dependency)
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.apartment, color: Color(0xFFD4A373), size: 32),
                    SizedBox(height: 8),
                    Text(
                      'Aurelia Grand Hotel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kuching Waterfront • 5-Star Luxury',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Reservation Details Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reservation Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4332),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Guest Name
                      TextFormField(
                        key: const Key('guestName'),
                        controller: _guestNameController,
                        decoration: const InputDecoration(
                          labelText: 'Guest Name',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Guest name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // Guest Email
                      TextFormField(
                        key: const Key('guestEmail'),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Guest Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Date Pickers
                      ListTile(
                        key: const Key('checkInPicker'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: const Color(0xFFE8F5E9),
                        leading: const Icon(
                          Icons.calendar_today,
                          color: Color(0xFF1B4332),
                        ),
                        title: Text(
                          _formatDate(_checkInDate, 'Select Check-in Date'),
                        ),
                        onTap: () => _pickDate(isCheckIn: true),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        key: const Key('checkOutPicker'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: const Color(0xFFE8F5E9),
                        leading: const Icon(
                          Icons.event,
                          color: Color(0xFF1B4332),
                        ),
                        title: Text(
                          _formatDate(_checkOutDate, 'Select Check-out Date'),
                        ),
                        onTap: () => _pickDate(isCheckIn: false),
                      ),
                      if (_dateError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 12),
                          child: Text(
                            _dateError!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      const SizedBox(height: 16),

                      // Sliders
                      Text(
                        'Adults: ${_adults.toInt()}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Slider(
                        value: _adults,
                        min: 1,
                        max: 6,
                        divisions: 5,
                        label: '${_adults.toInt()}',
                        onChanged: (val) => setState(() => _adults = val),
                      ),
                      Text(
                        'Children: ${_children.toInt()}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Slider(
                        value: _children,
                        min: 0,
                        max: 4,
                        divisions: 4,
                        label: '${_children.toInt()}',
                        onChanged: (val) => setState(() => _children = val),
                      ),

                      const Divider(height: 24),

                      // Checkboxes (Extras)
                      const Text(
                        'Extras',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4332),
                        ),
                      ),
                      ..._extras.keys.map((key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: _extras[key],
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (val) =>
                              setState(() => _extras[key] = val ?? false),
                        );
                      }),

                      const Divider(height: 24),

                      // Radio Buttons (Room View)
                      const Text(
                        'Room View',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4332),
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text('City View'),
                        value: 'City View',
                        groupValue: _roomView,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (val) => setState(() => _roomView = val!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Sea View'),
                        value: 'Sea View',
                        groupValue: _roomView,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (val) => setState(() => _roomView = val!),
                      ),

                      const SizedBox(height: 16),
                      ElevatedButton(
                        key: const Key('bookNowButton'),
                        onPressed: _submitBooking,
                        child: const Text('Book Now'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
