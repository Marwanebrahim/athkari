import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_cubit.dart';
import 'package:athkari/widgets/interval_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchValue = true;
  late int value = 5;
  @override
  void initState() {
    value = context.read<ZekrCubit>().getInterval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: AppColors.primary.withValues(alpha: 0.3),
          WidgetState.any: Colors.grey.shade400,
        });
    WidgetStateProperty<Color?> thumbColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: AppColors.primary,
          WidgetState.any: Colors.black,
        });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإعدادات',
          style: AppTextStyles.bold20.copyWith(color: AppColors.text1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "إعدادات التذكير",
              style: AppTextStyles.regular18.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              width: 358,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تفعيل التذكير",
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.text3,
                        ),
                      ),

                      Switch(
                        value: switchValue,
                        trackColor: trackColor,
                        thumbColor: thumbColor,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                          value
                              ? context.read<ZekrCubit>().registerTask()
                              : context.read<ZekrCubit>().cancelTask();
                        },
                      ),
                    ],
                  ),
                  Text(
                    "التذكير كل",
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.text3,
                    ),
                  ),
                  IntervalSelectorWidget(
                    value: value,
                    onIntervalChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                  Text(
                    "سيتم إرسال الأذكار بالترتيب تلقائياً حسب الفاصل الزمني المختار.",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.text2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
