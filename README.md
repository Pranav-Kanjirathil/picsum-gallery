# Picsum – Flutter App

A simple and responsive Flutter image gallery application that fetches images from the "Picsum Photos API" (https://picsum.photos/v2/list) and displays them in a clean, modern UI.

# Features

- Fetch images from the Picsum Photos API.
- Display images in a responsive grid layout.
- Show image author and details.
- Open images in a full-screen detail view.
- Zoom images using InteractiveViewer.
- Pull-to-refresh functionality.
- Infinite scrolling and pagination.
- Loading indicators and error handling.
- Cached network images for improved performance.

# Technologies Used

- Flutter – UI development
- Dart – Programming language
- Provider – State management
- HTTP – API integration
- Cached Network Image – Image loading and caching

# API Used

Picsum Photos API

https://picsum.photos/v2/list

The API provides image information, including:

- Image ID
- Author
- Image URL
- Download URL
- Image width
- Image height

# Dependencies

dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.2
  provider: ^6.1.2
  cached_network_image: ^3.4.1

# Project Structure

```text
lib/
├── main.dart
├── models/
│   └── photo_model.dart
├── providers/
│   └── gallery_provider.dart
├── screens/
│   └── gallery.dart
└── services/
    └── picsum_api.dart
```

# Installation and Setup

1. Clone the repository:

git clone https://github.com/Pranav-Kanjirathil/picsum-gallery.git

2. Navigate to the project directory:

cd picsum

3. Install dependencies:

flutter pub get

4. Run the application:

flutter run

# Requirements

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Internet connection

Author

Pranav Kanjirathil

GitHub: "Pranav-Kanjirathil" (https://github.com/Pranav-Kanjirathil)

---

Developed as part of a Flutter development task.
