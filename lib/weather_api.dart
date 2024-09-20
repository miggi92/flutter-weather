import 'dart:convert'; // Für die JSON-Verarbeitung
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getWeatherData(String cityName) async {
  const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  await dotenv.load(fileName: ".env");
  String apiKey = dotenv.env['WEATHER_API_KEY']!;

  final Uri url = Uri.parse('$apiUrl?q=$cityName&appid=$apiKey&units=metric');

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Fehler beim Abrufen der Wetterdaten');
  }
}
