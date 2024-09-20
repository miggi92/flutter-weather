import 'package:flutter/material.dart';
import 'package:myapp/weather_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final weatherData = await getWeatherData('Berlin');
      setState(() {
        _weatherData = weatherData;
      });
      print('Wetterdaten: $_weatherData');
    } catch (error) {
      print('Fehler: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _weatherData != null
            ? Column(
                // Zeige die Wetterdaten an, wenn sie verfügbar sind
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperatur: ${_weatherData!['main']['temp']}°C',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Beschreibung: ${_weatherData!['weather'][0]['description']}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  // Weitere Wetterdaten können hier hinzugefügt werden
                ],
              )
            : const CircularProgressIndicator(), // Zeige einen Ladeindikator, während die Daten geladen werden
      ),
    );
  }
}
