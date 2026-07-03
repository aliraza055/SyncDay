import 'package:flutter/material.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final double amount;
  final VoidCallback? onDelete;

  const ExpenseTile({
    super.key,
    required this.title,
    required this.amount,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardWhite),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.blackCardGradientEnd,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet_outlined,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: AppTextStyles.bodyRegular)),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: AppTextStyles.quickTitle,
          ),
          InkWell(
            onTap: onDelete,
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0),
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
