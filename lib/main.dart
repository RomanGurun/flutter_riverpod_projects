// ============================================================================
// WEATHER APP - FLUTTER MVVM WITH NOTIFIER PROVIDERS
// ============================================================================
// This is a complete production-ready weather app demonstrating:
// - MVVM Architecture
// - Repository Pattern
// - ChangeNotifierProvider & NotifierProvider State Management
// - Real API Integration (OpenWeatherMap)
// - Error Handling
// - Loading States
// - Beautiful UI with Animations

// ============================================================================
// SETUP INSTRUCTIONS:
// ============================================================================
// 1. Create a new Flutter project: flutter create weather_app
// 2. Add dependencies to pubspec.yaml:
//    dependencies:
//      flutter:
//        sdk: flutter
//      flutter_riverpod: ^2.4.9
//      http: ^1.1.0
//      geolocator: ^10.1.0
//      permission_handler: ^11.0.1
//      intl: ^0.18.1
//
// 3. Get a FREE API key from: https://openweathermap.org/api
// 4. Replace YOUR_API_KEY_HERE in the code below
// 5. Run: flutter pub get
// 6. Run: flutter run

// ============================================================================
// FILE STRUCTURE:
// ============================================================================
// lib/
// ├── main.dart
// ├── models/
// │   └── weather_model.dart
// ├── repositories/
// │   └── weather_repository.dart
// ├── services/
// │   ├── api_service.dart
// │   └── location_service.dart
// ├── providers/
// │   └── weather_provider.dart
// └── views/
//     └── home_screen.dart

// ============================================================================
// main.dart
// ============================================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/providers/weather_provider.dart';
import 'package:login/views/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App - Notifier Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


// ============================================================================
// BONUS: Example of using multiple providers together
// ============================================================================
class WeatherStatsWidget extends ConsumerWidget {
  const WeatherStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch specific providers for granular updates
    final isLoaded = ref.watch(isWeatherLoadedProvider);
    final temperature = ref.watch(currentTemperatureProvider);
    final forecastCount = ref.watch(forecastCountProvider);

    if (!isLoaded) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Current Temperature: ${temperature?.round()}°C'),
            Text('Forecast Items: $forecastCount'),
          ],
        ),
      ),
    );
  }
}