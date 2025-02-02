

# ParkIt - Smart Parking App


**ParkIt** is a modern parking management app designed to help users find nearby parking spots in Kolkata ,book them seamlessly, and manage their parking history. Built using Flutter, this app provides a sleek user interface for an enhanced user experience.

---

## Table of Contents

1. [Features](#features)
2. [Technologies Used](#technologies-used)
3. [Setup Instructions](#setup-instructions)
4. [Project Structure](#project-structure)
5. [Contributing](#contributing)

---

## Features

- **Google Maps Integration**: Displays nearby parking spots on an interactive map.
- **Booking System**: Allows users to select parking duration and book spots.
- **Payment Gateway**: Simulates payment processing with card and UPI options.
- **Profile Management**: Includes booking history, payment history, settings, and support.
- **Dark Mode Support**: Fully optimized for dark mode with vibrant accent colors.
- **Cupertino Design**: Modern iOS-like design with smooth animations and transitions.
- **Responsive UI**: Adapts to various screen sizes and orientations.



## Technologies Used

- **Flutter**: Cross-platform framework for building the app.
- **Dart**: Programming language used for app development.
- **Google Maps API**: For displaying maps and markers.
- **Geolocator**: For fetching the user's current location.
- **Cupertino Widgets**: For iOS-like design and animations.
- **Gradient Backgrounds and Animations**: For a modern and sleek UI.
- **State Management**: Simple state management using `setState`.

---

## Setup Instructions

### Prerequisites

1. Install [Flutter SDK](https://flutter.dev/docs/get-started/install).
2. Set up an IDE like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
3. Obtain a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/).

### Steps to Run the Project

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/parkit.git
   cd parkit
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Google Maps API Key**:
   - Open `android/app/src/main/AndroidManifest.xml`.
   - Replace `YOUR_GOOGLE_MAPS_API_KEY` with your actual API key:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="API_KEY"/>
     ```

4. **Run the App**:
   - For Android:
     ```bash
     flutter run
     ```
   - For iOS:
     ```bash
     cd ios && pod install && cd ..
     flutter run
     ```

5. **Enable Billing in Google Cloud Console**:
   - Ensure billing is enabled for your Google Cloud project to use the Maps API.

---

## Project Structure

```
lib/
├── main.dart                # Entry point of the app
├── models/                  # Data models (e.g., ParkingSpot)
│   └── parking_spot.dart
├── screens/                 # Screens of the app
│   ├── home_page.dart       # Home screen with Google Maps
│   ├── profile_page.dart    # Profile screen
│   ├── payment_gateway.dart # Payment gateway screen
│   ├── booking_history_page.dart
│   ├── payment_history_page.dart
│   ├── help_support_page.dart
│   └── settings_page.dart
├── widgets/                 # Reusable widgets
│   ├── parking_spot_card.dart
│   └── booking_sheet.dart
android/                     # Android-specific files
ios/                         # iOS-specific files
pubspec.yaml                 # Dependencies and assets configuration
README.md                    # This file
```

---

## Contributing

We welcome contributions to improve **ParkIt**! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -m "Add your feature"`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a pull request.

Please ensure your code adheres to the existing style and includes appropriate documentation.

---


## Contact

For questions or feedback, feel free to reach out:

- **Email**: asadrahmani3101@gmail.com
- **GitHub**: [@rahmani3101](https://github.com/rahmani3101)
- **LinkedIn**: [Mohammad Asad Rahmani](www.linkedin.com/in/mohammad-asad-rahmani-a39b57257)

---
