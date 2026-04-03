import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectionCardWidget extends StatelessWidget {
  const SelectionCardWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: _getBoxDecoration(),
        child: Text(
          title,
          style: AppTextStyles.regular14.copyWith(
            color: isSelected ? AppColors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
    color: isSelected
        ? AppColors.primary
        : AppColors.primary.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(10),
  );
}
