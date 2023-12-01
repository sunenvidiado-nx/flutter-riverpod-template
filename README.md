# Flutter Riverpod Template

<p> 
  <img src="https://github.com/sunenvidiado-nx/flutter-riverpod-template/actions/workflows/test.yaml/badge.svg" height="20"/>
  <a href="https://codecov.io/gh/sunenvidiado-nx/flutter-riverpod-template" > 
    <img src="https://codecov.io/gh/sunenvidiado-nx/flutter-riverpod-template/branch/main/graph/badge.svg?token=PSV5VTSZAI"/> 
  </a>
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter" height="20">
  <img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white" height="20">
</p>

A Flutter app template demonstrating the use of Riverpod for state management. This template fetches and displays posts from the r/flutterdev subreddit to showcase app architecture and functionalities.

## Features 🚀

* **Efficient State Management**: Utilizes Riverpod for streamlined and scalable state management within the app.
* **Reddit Posts Display**: Fetches and exhibits posts from the r/flutterdev subreddit, providing a demonstration of fetching and showcasing data from an external API.
* **Simplified Routing**: Utilizes GoRouter for straightforward and adaptable navigation within the application.
* **Flutter Secure Storage**: Uses Flutter Secure Storage for secure and persistent storage of sensitive data.
* **Structured Data Handling**: Implements Freezed and JSON Serializable for organized and efficient handling of data models and JSON serialization.

## Folder Structure 📂

```
flutter_riverpod_template/
├─ lib/
│   ├─ core/                   # Core functionalities and providers
│   ├─ features/               # Feature-specific widgets and providers
│   │   ├─ app/                # Contains the MaterialApp widget
│   │   ├─ home/               # Contains the HomeScreen widget
│   │   │   ├─ application/    # State management and business logic
│   │   │   ├─ data/           # Data sources and repositories
│   │   │   ├─ domain/         # Entities and value objects
│   │   │   ├─ presentation/   # UI layer
│   ├─ main.dart               # App entry point 
├─ test/                       # Test files
├─ pubspec.yaml                # Dependency configuration
├─ README.md                   # Project documentation          
```

## License 📝

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Feel free to customize this README according to your project's specifics. Good luck with your Flutter app development! 🌟