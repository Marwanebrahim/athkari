import 'package:athkari/cubit/zekr%20cubit/zekr_cubit.dart';
import 'package:athkari/widgets/selection_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntervalSelectorWidget extends StatefulWidget {
  const IntervalSelectorWidget({
    super.key,
    required this.value,
    required this.onIntervalChanged,
  });
  final int value;
  final Function(int) onIntervalChanged;
  @override
  State<IntervalSelectorWidget> createState() => _IntervalSelectorWidgetState();
}

class _IntervalSelectorWidgetState extends State<IntervalSelectorWidget> {
  Map<int, Map<String, Object>> get intervalsList => {
    0: {"text": "15 دقائق", "value": 15},
    1: {"text": "30 دقائق", "value": 30},
    2: {"text": "ساعة", "value": 60},
    3: {"text": "3 ساعات", "value": 180},
    4: {"text": "يوم", "value": 1440},
  };
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: [
        for (int i = 0; i < 5; i++)
          SelectionCardWidget(
            title: intervalsList[i]!["text"] as String,
            isSelected: intervalsList[i]!["value"] as int == widget.value,
            onTap: () {
              context.read<ZekrCubit>().saveInterval(
                intervalsList[i]!["value"] as int,
              );
              widget.onIntervalChanged(intervalsList[i]!["value"] as int);
            },
          ),
      ],
    );
  }
}
