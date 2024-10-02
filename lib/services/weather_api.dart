import 'dart:convert'; // Für die JSON-Verarbeitung
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getWeatherData(
    String location, String language) async {
  const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  await dotenv.load(fileName: ".env");
  String apiKey = dotenv.env['WEATHER_API_KEY']!;
  Uri url;

  if (location.contains(',')) {
    final coordinates = location.split(',');
    final latitude = coordinates[0].trim();
    final longitude = coordinates[1].trim();

    url = Uri.parse(
        '$apiUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=$language');
  } else {
    url = Uri.parse(
        '$apiUrl?q=$location&appid=$apiKey&units=metric&lang=$language');
  }

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Fehler beim Abrufen der Wetterdaten');
  }
}

String getWeathericonUrl(String iconCode) {
  return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
}
