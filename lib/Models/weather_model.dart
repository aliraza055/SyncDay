class WeatherModel {
  final double temperature;
  final String condition;
  final int humidity;
  final double wind;
  final int uvIndex;

  WeatherModel({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.wind,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'].toDouble(),
      uvIndex: 0,
    );
  }
}
