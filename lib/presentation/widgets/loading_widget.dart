import 'package:flutter/material.dart';
import 'package:time_line_app/core/style/app_color.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColor.redLight,
        ),
      ),
    );
  }
}
