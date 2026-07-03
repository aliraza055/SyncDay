import 'package:flutter/cupertino.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';

class WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherStat({
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
