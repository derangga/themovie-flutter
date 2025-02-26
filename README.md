# Movie App Flutter

[![Build Status](https://app.bitrise.io/app/7397ae0265733cea/status.svg?token=sKNumaLIwncD5Csa52j97w&branch=development)](https://app.bitrise.io/app/7397ae0265733cea)

## App Module Structure 🧬

Each feature module contains three layers : **Data Layer**, **Domain Layer**, **Presentation Layer**

<p align="center">
  <img src="screenshots/diagrams.png" />
</p>
<br></br>

## Library used 🛠

- [Dio](https://pub.dev/packages/dio) - A type-safe HTTP client.
- [Drift](https://pub.dev/packages/drift) - Drift is a reactive persistence library for Flutter and Dart, built ontop of sqlite.
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) - A Flutter plugin to store data in secure storage
- [GetIt](https://pub.dev/packages/get_it) - A Dependency Injection
- [BLoC](https://pub.dev/packages/flutter_bloc) - Business logic component to separate the business logic with UI.
- [Dartz](https://pub.dev/packages/dartz) - Functional programming in Dart
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv) - Plugin that exposes environment variables to your Dart code in Flutter as well as to your native code in iOS and Android.

## Quick Start 💻

1. Before run this project makesure you have `.env` in root project directory. If not you can create `.env` then write this setup enviroment :

```
API_GATWAY=https://api.themoviedb.org/3/
TMDB_SECRET_KEY=SECRET TOKEN FROM TMDB
```

2. Generate dart code with `./generate-as-build.sh`

```
$ sudo chmod 774 generate-as-build.sh
$ ./generate-as-build.sh
```

## App Design 🎨

1. UI/UX References - [Kinema Mobile App](https://www.behance.net/gallery/105169187/Kinema-Online-Movies-App-Concept-for-IOS) - [Netflix](https://www.behance.net/gallery/109813137/NETFLIX-APP?tracking_source=search_projects_recommended%7Cnetflix%20mobile%20app)
   <br></br>
2. Color Palette
<p align="center">
  <img src="screenshots/palette.png" width="300"/>
</p>
<br></br>
