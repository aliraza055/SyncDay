import 'package:flutter/material.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';

/// Single row in the Task Manager list.
/// Pure UI — pass `isChecked`, wire up onToggle/onDelete to your
/// GetX controller once it exists.
class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;

  const TaskTile({
    super.key,
    required this.title,
    this.isChecked = false,
    this.onToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? AppColors.checkedGrey : Colors.transparent,
                border: Border.all(
                  color: isChecked
                      ? AppColors.cardWhite
                      : AppColors.checkedGrey,
                  width: 1.5,
                ),
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: isChecked
                  ? AppTextStyles.bodyStrike
                  : AppTextStyles.bodyRegular,
            ),
          ),
          InkWell(
            onTap: onDelete,
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.delete_outline,
                size: 20,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
