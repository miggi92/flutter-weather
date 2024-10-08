import 'package:flutter/material.dart';
import 'package:mgm12_weather/screens/home_screen.dart';
import 'package:mgm12_weather/themes/dark_theme.dart';
import 'package:mgm12_weather/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}
