# Flutter App - Profile and Authentication Management

This project is a Flutter-based application designed for user authentication and profile management. It includes functionality for email/mobile login, OTP verification, profile data submission, and storage in local storage (using `SharedPreferences`).


This includes the installation commands (`flutter pub get`, `flutter run`, and `flutter build apk`) followed by a description of the features and project structure.

## Features
- **Email and Mobile Login:** Users can log in using either email or mobile number.
- **OTP Verification:** Mock OTP verification for enhanced security.
- **Profile Management:** Users can submit and view their profile information.
- **Local Storage:** Profile data is saved using `SharedPreferences`.
- **State Management:** Integrated state management using the `Provider` package.
- **Animated UI:** Smooth transitions implemented using `AnimatedPositioned` for enhanced user experience.

---

## Project Structure

```plaintext
lib/
├── constants/
│   ├── app_assets.dart        # Asset paths
│   ├── app_colors.dart        # Theme color constants
│   ├── app_theme.dart         # App-wide theme
│   ├── app_constants.dart     # App-contant values
├── pages/
│   ├── auth/
│   │   ├── login_page.dart    # Login functionality with OTP verification
│   │   ├── create_password.dart # Dummy password creation page
│   ├── profile_page.dart      # Profile submission form
│   ├── edit_profile_page.dart # Confirmation and edit profile page
├── services/
│   ├── comFuncService.dart    # Common utility functions
├── widgets/
│   ├── button_widget.dart     # Custom button widget
│   ├── heading_widget.dart    # Custom heading widget
│   ├── textbox_widget.dart    # Custom textbox widget
├── main.dart                  # App entry point with GoRouter setup
