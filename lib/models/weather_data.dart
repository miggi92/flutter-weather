class WeatherData {
  final Coordinates coordinates;
  final List<Weather> weather;
  final String base;
  final MainWeatherData main;
  final int visibility;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherData({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      coordinates: Coordinates.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((weatherJson) => Weather.fromJson(weatherJson))
          .toList(),
      base: json['base'],
      main: MainWeatherData.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      rain: Rain.fromJson(json['rain'] ?? {}), // Handle null value for rain
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Coordinates {
  final double lon;
  final double lat;

  Coordinates({required this.lon, required this.lat});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class MainWeatherData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainWeatherData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainWeatherData.fromJson(Map<String, dynamic> json) {
    return MainWeatherData(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'] ?? 0, // Handle null value for sea_level
      grndLevel: json['grnd_level'] ?? 0, // Handle null value for grnd_level
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust']?.toDouble() ?? 0,
    );
  }
}

class Rain {
  final double oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h']?.toDouble() ?? 0.0, // Handle null value for 1h
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
