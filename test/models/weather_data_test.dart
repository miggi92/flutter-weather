import 'package:flutter_test/flutter_test.dart';
import 'package:mgm12_weather/models/weather_data.dart';

void main() {
  group('WeatherData', () {
    test('WeatherData.fromJson() creates a WeatherData object from valid JSON',
        () {
      final json = {
        "coord": {"lon": 13.376935, "lat": 52.516181},
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 14.9,
          "feels_like": 14.35,
          "temp_min": 12.97,
          "temp_max": 15.51,
          "pressure": 1010,
          "humidity": 73,
          "sea_level": 1010,
          "grnd_level": 985
        },
        "visibility": 10000,
        "wind": {"speed": 0.45, "deg": 228, "gust": 0.89},
        "rain": {"1h": 0.15},
        "clouds": {"all": 85},
        "dt": 1727871334,
        "sys": {
          "type": 2,
          "id": 2037964,
          "country": "DE",
          "sunrise": 1727846690,
          "sunset": 1727888427
        },
        "timezone": 7200,
        "id": 3274259,
        "name": "Berlin",
        "cod": 200
      };

      final weatherData = WeatherData.fromJson(json);

      expect(weatherData.coordinates.lon, 13.376935);
      expect(weatherData.coordinates.lat, 52.516181);
      expect(weatherData.weather.length, 1);
      expect(weatherData.weather[0].main, "Rain");
      expect(weatherData.main.temp, 14.9);
      expect(weatherData.name, "Berlin");
    });
  });
}
