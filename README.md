# Check In Really

Check In Really is an internal mobile event application designed for employees to check in at various physical locations. The app utilizes geolocation to confirm check-ins and retrieves achievement titles via an API upon successful check-in.

## Key Features

- **Location-Based Check-In**: The app detects the user's GPS location to validate check-ins at 7 unique locations.
- **Check-In Confirmation**: If the user is within range, the app displays an animation, a success message, and the achievement title.
- **Achievement API Call**: After check-in, the app sends an API call to retrieve and display the achievement title.
- **Progress Tracker**: Users can visually track their progress (e.g., 3/7 completed) through a progress bar or achievement wheel.
- **Gamified UI**: The app features friendly animations, icons, and celebratory effects like confetti upon full completion.
- **Admin Config Panel (Optional)**: Future-proofing with an admin panel to manage location coordinates and event dates.

## Experience Design Goals

- **Simple**: One-tap check-in with minimal friction.
- **Motivating**: Celebrate every check-in with engaging animations.
- **Visual**: Clear map and location progress tracking.
- **Fast**: Quick API calls for achievements.
- **Offline-Aware**: Graceful handling when location/GPS is unavailable.

## UX/UI Design Flows

1. **Home Screen**: Displays the progress indicator, check-in button, and optional map view.
2. **Check-In Screen**: Handles location permission checks and displays the check-in status.
3. **Achievements Screen**: Lists achievements and their statuses.

## Technical Requirements

- **Platform**: Flutter (iOS & Android)
- **GPS Accuracy**: ≤50 meters
- **API Call**: `GET /achievements?point_id={id}`
- **Auth**: Internal SSO (e.g., by Employee ID or Email)
- **Storage**: Local progress saved with fallback (SQLite or SharedPrefs)

## User Roles

- **Employee**: Check-in and view achievements.
- **Admin (Optional)**: Manage location list and track completion.

## User Stories

- **US001**: Check-In Flow
- **US002**: View Achievements
- **US003**: See Progress Summary
- **US004**: Handle Location Errors
- **US005**: Permission Handling

## Setup Instructions

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Use `flutter run` to start the application on your device or emulator.

## Usage

- Open the app and grant location permissions.
- Tap "Check In Now" when at a check-in location.
- View your achievements and progress on the respective screens.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.