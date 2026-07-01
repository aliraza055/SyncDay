class WeatherModel {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final int uvIndex;
  final String condition;
  final int weatherCode;

  WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.uvIndex,
    required this.condition,
    required this.weatherCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    final code = (current['weather_code'] as num?)?.toInt() ?? 0;
    return WeatherModel(
      temperature: (current['temperature_2m'] as num?)?.toDouble() ?? 0,
      humidity: (current['relative_humidity_2m'] as num?)?.toInt() ?? 0,
      windSpeed: (current['wind_speed_10m'] as num?)?.toDouble() ?? 0,
      uvIndex: (current['uv_index'] as num?)?.toInt() ?? 0,
      condition: _conditionFromCode(code),
      weatherCode: code,
    );
  }

  static String _conditionFromCode(int code) {
    if (code == 0) return 'Clear Sky';
    if (code <= 2) return 'Partly Cloudy';
    if (code == 3) return 'Overcast';
    if (code <= 48) return 'Foggy';
    if (code <= 67) return 'Rainy';
    if (code <= 77) return 'Snowy';
    if (code <= 82) return 'Rain Showers';
    if (code <= 99) return 'Thunderstorm';
    return 'Partly Cloudy';
  }
}
