import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncday/Controllers/weather_controller.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';
import 'package:syncday/widgets/app_bar.dart';
import 'package:syncday/widgets/weather_stat.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});
  final WeatherController controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Weather'),

      body: SafeArea(
        top: false,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final weather = controller.weather.value;

          if (weather == null) {
            return const Center(child: Text("No Data"));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(0.05),
              vertical: 16,
            ),
            child: Column(
              children: [
                // 🌍 CITY
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(controller.city, style: AppTextStyles.subtitle),
                  ],
                ),

                const SizedBox(height: 28),

                // 🌤 ICON
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.wb_cloudy_outlined,
                    size: 44,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.temperature.toStringAsFixed(0),
                      style: AppTextStyles.giantTemp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '°',
                        style: AppTextStyles.giantTemp.copyWith(fontSize: 32),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // ☁ CONDITION
                Text(weather.condition, style: AppTextStyles.heading2),
                const SizedBox(height: 32),
                // 📊 STATS
                Row(
                  children: [
                    Expanded(
                      child: WeatherStat(
                        icon: Icons.water_drop_outlined,
                        label: 'Humidity',
                        value: '${weather.humidity}%',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WeatherStat(
                        icon: Icons.air,
                        label: 'Wind',
                        value: '${weather.wind} mph',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WeatherStat(
                        icon: Icons.wb_sunny_outlined,
                        label: 'UV Index',
                        value: weather.uvIndex.toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
