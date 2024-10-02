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
      home: MyHomePage(title: 'Weather App'),
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
  final _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final cityName = _cityController.text;
      final weatherData = await getWeatherData(cityName);
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Stadt',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: _fetchWeatherData,
                  child: const Text('Wetter anzeigen')),
              if (_weatherData != null)
                Column(
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
                ),
              if (_cityController.text.isNotEmpty && _weatherData == null)
                const CircularProgressIndicator(),
            ]),
      ),
    );
  }
}
