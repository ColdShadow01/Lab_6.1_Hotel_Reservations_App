![Flutter CI](https://github.com/ColdShadow01/Lab_6.1_Hotel_Reservations_App/actions/workflows/flutter_ci.yml/badge.svg)

# Aurelia Grand Hotel — Hotel Reservation App (Lab Exercise 6.1)

A Flutter hotel reservation application built with Material 3 guidelines for **TMA3084 Software Engineering Laboratory (Lesson 8)** at Universiti Malaysia Sarawak (UNIMAS).

## Features & Screens

1. **Sign Up Page (`lib/signup_page.dart`)**: Account creation UI with styled `TextField` inputs and navigation to the Dashboard and Login screens.
2. **Login Page (`lib/login_page.dart`)**: Returning user interface with obscured password input and route navigation.
3. **Dashboard / Booking Page (`lib/dashboard_page.dart`)**:
   - **Form & Validation**: `Form` and `TextFormField` widgets with `Key`s validating required guest name, valid email format, and check-in/check-out dates.
   - **Date Pickers**: `showDatePicker` for selecting check-in and check-out dates.
   - **Sliders**: Interactive `Slider` widgets for selecting the number of adults and children.
   - **Checkboxes**: `CheckboxListTile` options for booking extras (Breakfast, Airport Pickup, Spa Access).
   - **Radio Buttons**: `RadioListTile` options for selecting room view (City View vs. Sea View).
4. **Room List Page (`lib/room_list_page.dart`)**: Collapsible `ExpansionTile` cards displaying room details and pricing, with a `SnackBar` confirmation upon room selection.

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run
