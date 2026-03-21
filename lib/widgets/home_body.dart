import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_cubit.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_state.dart';

import 'package:athkari/screens/zekr_editor.dart';
import 'package:athkari/widgets/current_zekr.dart';
import 'package:athkari/widgets/delete_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocBuilder<ZekrCubit, ZekrState>(
        builder: (BuildContext context, state) {
          if (state is ZekrLoaded) {
            return Column(
              children: [
                CurrentZekr(state: state),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      "قائمة الأذكار",
                      style: AppTextStyles.bold18.copyWith(
                        color: AppColors.text3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${state.adhkar.length} أذكار",
                      style: AppTextStyles.semibold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.adhkar.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withAlpha(14),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.adhkar[index],
                                style: AppTextStyles.semibold16.copyWith(
                                  color: AppColors.text1,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ZekrEditor(zekr: state.adhkar[index]),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: AppColors.lightGray,
                                size: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                final result = await showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<ZekrCubit>(),
                                    child: DeleteBottomSheet(index: index),
                                  ),
                                );
                                if (result == true && context.mounted) {
                                  context.read<ZekrCubit>().getAdhkar();
                                }
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.lightGray,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Text("UnKnown State");
        },
      ),
    );
  }
}
