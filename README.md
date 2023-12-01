# Flutter Riverpod Template

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