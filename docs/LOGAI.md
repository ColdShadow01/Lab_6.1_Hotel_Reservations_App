### 2. `docs/LOGAI.md` (AI Usage Log)




### AI Usage Log (LOGAI) — Lab Exercise 6.1

- **Student:** Wan Adam Danish Bin Wan Abit (103014)
- **Project:** `hotel_reservation_app` (Lab Exercise 6.1)
- **AI Tool Used:** Google Gemini
- **Date:** 2026-11-25

---

## Summary of AI Assistance

| # | Task / Component | Prompt Summary | AI Contribution | Manual Verification & Changes |
| :- | :--- | :--- | :--- | :--- |
| 1 | **App Architecture & UI** (`main.dart`, `signup_page.dart`, `login_page.dart`, `dashboard_page.dart`, `room_list_page.dart`) | Requested help implementing Lab 6.1 Hotel Reservation App in Android Studio based on Lesson 8 slides. | Generated a custom Material 3 Emerald & Gold theme, named routing, all 4 required screens, and Lesson 8 widgets (Date Picker, Slider, Checkbox, Radio, ExpansionTile, SnackBar, Form validation). | Created the Flutter project in Android Studio, organized files under `lib/`, and verified UI layout and navigation locally. |
| 2 | **Widget Validation Tests** (`test/widget_test.dart`) | Requested widget tests for booking form validators using the default test file. | Generated 5 `testWidgets` cases covering empty/filled guest name, invalid/valid email, and missing check-in/check-out dates using widget `Key`s. | Replaced default boilerplate in `test/widget_test.dart` and ran `flutter test --coverage` locally to confirm all tests pass. |
| 3 | **CI/CD & Documentation** (`.github/workflows/flutter_ci.yml`, `README.md`, `docs/LOGAI.md`) | Requested GitHub Actions coverage workflow, `README.md` with CI badge, and AI usage documentation. | Provided GitHub Actions YAML for `flutter test --coverage` + HTML artifact upload, `README.md` template, and `LOGAI.md` structure. | Added `coverage/` to `.gitignore`, updated the CI badge URL with the repository path, and verified green CI + downloadable coverage artifact on GitHub. |