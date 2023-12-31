# Flutter Riverpod Template

<p> 
  <img src="https://github.com/sunenvidiado-nx/flutter-riverpod-template/actions/workflows/test.yaml/badge.svg"/>
  <a href="https://codecov.io/gh/sunenvidiado-nx/flutter-riverpod-template" target="_blank"> 
    <img src="https://img.shields.io/codecov/c/github/sunenvidiado-nx/flutter-riverpod-template"/> 
  </a>
  <a href="https://flutter.dev" target="_blank">
    <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter" height="20">
  </a>
  <img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white" height="20">
</p>

A Flutter app template that seamlessly handles state management and dependency injection with [`riverpod`](https://riverpod.dev).

## Features 🚀

* **Efficient State Management with Dependency Injection**: Utilizes [`riverpod`](https://riverpod.dev) to seamlessly inject dependencies and maintain a clear, scalable state management architecture.
* **Simplified Data Fetching**: Uses [`retrofit`](https://pub.dev/packages/retrofit) and [`dio`](https://pub.dev/packages/dio) for seamless data retrieval. Demonstrates practical data fetching with posts from [`r/FlutterDev`](https://reddit.com/r/flutterdev)
* **Easy Routing**: Utilizes [`go_router`](https://pub.dev/packages/go_router) for straightforward and adaptable navigation within the application.
* **Flutter Secure Storage**: Uses [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage) for secure and persistent storage of sensitive data.
* **Structured Data Handling**: Utilizes [`freezed`](https://pub.dev/packages/freezed) and [`json_serializable`](https://pub.dev/packages/json_serializable) for organized and efficient handling of data models and JSON serialization.

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

This project is licensed under the MIT License - see the [license](license) file for details.

Feel free to customize this README according to your project's specifics. Good luck with your Flutter app development! 🌟