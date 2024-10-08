// widgets/weather_display.dart

import 'package:flutter/material.dart';
import 'package:mgm12_weather/models/weather_data.dart';
import 'package:mgm12_weather/services/weather_api.dart';

class WeatherDisplay extends StatefulWidget {
  const WeatherDisplay({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
                getWeathericonUrl(widget.weatherData.weather[0].icon)),
            Text(
              'Temperatur: ${widget.weatherData.main.temp}°C',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Beschreibung: ${widget.weatherData.weather[0].description}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _showDetails = !_showDetails;
                });
              },
              child: Text(
                  _showDetails ? 'Details ausblenden' : 'Details anzeigen'),
            ),
            if (_showDetails)
              Column(
                children: [
                  Text(
                      'Windgeschwindigkeit: ${widget.weatherData.wind.speed} m/s'),
                  Text(
                      'Luftfeuchtigkeit: ${widget.weatherData.main.humidity}%'),
                  Text('Luftdruck: ${widget.weatherData.main.pressure} hPa'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
