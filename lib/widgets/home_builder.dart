import 'package:athkari/core/constants/app_colors.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_cubit.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_state.dart';
import 'package:athkari/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZekrCubit, ZekrState>(
      builder: (BuildContext context, state) {
        if (state is ZekrLoading) {
          return SpinKitFadingCube(color: AppColors.primary, size: 40);
        }
        if (state is ZekrError) {
          return Center(child: Text(state.message));
        }
        if (state is ZekrLoaded) {
          return HomeBody();
        }
        return Text("UnKnown State");
      },
    );
  }
}
