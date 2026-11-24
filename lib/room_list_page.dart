import 'package:flutter/material.dart';

class RoomItem {
  final String name;
  final String summary;
  final String bedInfo;
  final String price;
  final IconData icon;

  RoomItem({
    required this.name,
    required this.summary,
    required this.bedInfo,
    required this.price,
    required this.icon,
  });
}

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  final List<RoomItem> _rooms = [
    RoomItem(
      name: 'King Room',
      summary: 'Large king bed, complimentary breakfast, high-speed Wi-Fi',
      bedInfo: '1 King Bed • 42 sqm',
      price: 'RM 380 / night',
      icon: Icons.king_bed,
    ),
    RoomItem(
      name: 'Double Bed Room',
      summary: 'Two single beds, city view, private balcony',
      bedInfo: '2 Single Beds • 36 sqm',
      price: 'RM 320 / night',
      icon: Icons.bedroom_parent,
    ),
    RoomItem(
      name: 'Family Suite',
      summary: 'Two bedrooms, spacious living room, kitchenette',
      bedInfo: '1 King + 2 Single Beds • 70 sqm',
      price: 'RM 620 / night',
      icon: Icons.family_restroom,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Room')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _rooms.length,
        itemBuilder: (context, index) {
          final room = _rooms[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B4332),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  room.icon,
                  color: const Color(0xFFD4A373),
                  size: 28,
                ),
              ),
              title: Text(
                room.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332),
                ),
              ),
              subtitle: Text(
                room.price,
                style: const TextStyle(
                  color: Color(0xFFB07D4F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF1F8F5),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bed Information: ${room.bedInfo}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4332),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(room.summary),
                      const SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${room.name} Reserved Successfully!',
                              ),
                              backgroundColor: const Color(0xFF1B4332),
                            ),
                          );
                        },
                        child: const Text('Select Room'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
