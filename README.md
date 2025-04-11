# 🎬 Movie Explorer Flutter

A cross-platform Flutter application to discover and explore movies in a beautifully designed interface.

---

## 📱 Features

- **Movie Discovery**: Browse a curated list of movies.
- **Detailed Information**: View detailed info for each movie—title, overview, rating, release date.
- **Responsive Design**: Optimized for phones, tablets, and desktops.
- **Cross-Platform**: Works on Android, iOS, Web, and Desktop.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A suitable editor (Android Studio, VS Code)

### Installation

```bash
git clone https://github.com/victor-rana/movie-explorer-flutter.git
cd movie-explorer-flutter
flutter pub get
flutter run
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📂 Project Structure

```plaintext
lib/
├── constants/            # App-wide constant values (colors, URLs, keys)
│   └── constants.dart
│
├── models/               # Data models (e.g., Movie)
│   └── movie.dart
│
├── screens/              # UI screens
│   ├── home_screen.dart
│   └── movie_detail_screen.dart
│
├── services/             # API service layer
│   └── api_service.dart
│
├── widgets/              # Reusable UI components
│   ├── movie_card.dart
│   └── rating_widget.dart
│
└── main.dart             # App entry point
```

---

For more info on Flutter, visit the [official Flutter docs](https://flutter.dev/docs).

