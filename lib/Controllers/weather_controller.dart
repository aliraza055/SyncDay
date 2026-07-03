import 'package:get/get.dart';
import 'package:syncday/Services/weather_services.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  final WeatherService _service = WeatherService();

  var weather = Rxn<WeatherModel>();
  var isLoading = false.obs;

  String city = "Lahore";

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  void getWeather() async {
    try {
      isLoading.value = true;

      final data = await _service.fetchWeather(city);
      weather.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void changeCity(String newCity) {
    city = newCity;
    getWeather();
  }
}
