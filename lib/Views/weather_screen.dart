import 'package:flutter/material.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';
import 'package:syncday/widgets/app_bar.dart';

/// Pure UI screen — static dummy data for now.
/// Wire this up to WeatherController (GetX) yourself:
/// - fetch from an API in services/weather_service.dart
/// - expose Rx fields: temperature, condition, humidity, wind, uvIndex
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Weather'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(0.05),
            vertical: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text('San Francisco, CA', style: AppTextStyles.subtitle),
                ],
              ),
              const SizedBox(height: 28),

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
                  Text('68', style: AppTextStyles.giantTemp),
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
              Text('Partly Cloudy', style: AppTextStyles.heading2),
              const SizedBox(height: 4),
              Text('Fahrenheit', style: AppTextStyles.subtitle),

              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: _WeatherStat(
                      icon: Icons.water_drop_outlined,
                      label: 'Humidity',
                      value: '72%',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _WeatherStat(
                      icon: Icons.air,
                      label: 'Wind',
                      value: '14 mph',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _WeatherStat(
                      icon: Icons.wb_sunny_outlined,
                      label: 'UV Index',
                      value: '3',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.cardLabel),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.quickTitle),
        ],
      ),
    );
  }
}
