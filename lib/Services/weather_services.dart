import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String apiKey = "8da7808baf59a1b92ef800672f2fd1b1";

  Future<WeatherModel> fetchWeather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to load weather");
    }
  }
}
