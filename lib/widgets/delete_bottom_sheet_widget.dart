// ignore_for_file: use_build_context_synchronously

import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_cubit.dart';
import 'package:athkari/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBottomSheet extends StatefulWidget {
  const DeleteBottomSheet({super.key, required this.index});
  final int index;

  @override
  State<DeleteBottomSheet> createState() => _DeleteBottomSheetState();
}

class _DeleteBottomSheetState extends State<DeleteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 30,
        children: [
          CustomButtonWidget(
            onTap: () {
              context.read<ZekrCubit>().deleteAdhkar(index: widget.index);
              Navigator.pop(context);
            },
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                " حذف",
                style: AppTextStyles.semibold20.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),

          CustomButtonWidget(
            onTap: () {
              Navigator.pop(context);
            },
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                "تراجع",
                style: AppTextStyles.semibold20.copyWith(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
