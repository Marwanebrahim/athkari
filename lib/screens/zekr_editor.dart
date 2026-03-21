import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/zekr cubit/zekr_cubit.dart';

class ZekrEditor extends StatefulWidget {
  const ZekrEditor({super.key, required this.zekr,  this.index});
  final String? zekr;
  final int? index;
  @override
  State<ZekrEditor> createState() => _ZekrEditorState();
}

class _ZekrEditorState extends State<ZekrEditor> {
  final TextEditingController _controller = .new();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.zekr ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "إضافة ذكر",
          style: AppTextStyles.semibold18.copyWith(color: AppColors.text1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Divider(color: AppColors.primary.withAlpha(26)),
            Text(
              "نص الذكر",
              style: AppTextStyles.bold14.copyWith(color: AppColors.primary),
            ),
            SizedBox(
              height: 300,
              child: TextField(
                maxLines: 10,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "اكتب الذكر هنا",
                  hintStyle: AppTextStyles.regular16.copyWith(
                    color: AppColors.lightGray,
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primary.withAlpha(51),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primary.withAlpha(51),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Divider(color: AppColors.primary.withAlpha(51)),
            GestureDetector(
              onTap: () {
                if (widget.zekr != null) {
                  // edit mode
                  context.read<ZekrCubit>().editAdhkar(
                    index: widget.index!,
                    newZekr: _controller.text,
                  );
                } else {
                  // add mode
                  context.read<ZekrCubit>().saveAdhkar(zekr: _controller.text);
                }
                Navigator.pop(context);
              },
              child: Container(
                width: 358,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_outlined, color: AppColors.white),
                    Text(
                      "حفظ الذكر",
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
