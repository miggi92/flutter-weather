import 'package:flutter/material.dart';
import 'package:mgm12_weather/models/weather_data.dart';
import 'package:mgm12_weather/widgets/city_search.dart';
import 'package:mgm12_weather/widgets/weather_display.dart';
import 'package:mgm12_weather/services/geo_locator.dart';
import 'package:mgm12_weather/services/weather_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData? _weatherData;
  String _userLanguage = 'EN';
  final _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserLanguage();
    _getLocation();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData([String? location]) async {
    try {
      location ??= _cityController.text;
      final weatherData = await getWeatherData(location, _userLanguage);
      setState(() {
        _weatherData = weatherData;
        _cityController.text = weatherData.name;
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fehler: $error')),
      );
    }
  }

  Future<void> _getLocation() async {
    try {
      final position = await getLocation();
      final location = '${position.latitude}, ${position.longitude}';
      _fetchWeatherData(location);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fehler: $error')),
      );
    }
  }

  void _getUserLanguage() {
    Locale myLocale = WidgetsBinding.instance.platformDispatcher.locale;
    setState(() {
      _userLanguage = myLocale.languageCode;
    });
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
              CitySearch(
                  controller: _cityController,
                  onSubmitted: (text) => _fetchWeatherData()),
              ElevatedButton(
                  onPressed: _fetchWeatherData,
                  child: const Text('Wetter anzeigen')),
              if (_weatherData != null)
                WeatherDisplay(weatherData: _weatherData!),
              if (_cityController.text.isNotEmpty && _weatherData == null)
                const CircularProgressIndicator(),
            ]),
      ),
    );
  }
}
