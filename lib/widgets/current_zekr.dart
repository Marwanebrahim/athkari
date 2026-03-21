import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../cubit/zekr cubit/zekr_state.dart';

class CurrentZekr extends StatelessWidget {
  const CurrentZekr({super.key, required this.state});
  final ZekrLoaded state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: 358,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 86,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.white.withAlpha(51),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      "كل 30 دقيقة",
                      style: AppTextStyles.semibold12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.white,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "الذكر القادم",
              style: AppTextStyles.regular16.copyWith(
                color: AppColors.white.withAlpha(204),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.adhkar[state.currentIndex],
              style: AppTextStyles.bold24.copyWith(color: AppColors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
