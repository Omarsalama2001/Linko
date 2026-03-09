import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/utils/theme/app_theme.dart';

// ignore: must_be_immutable
class MainElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  WidgetStatePropertyAll<Color?>? color;
  MainElevatedButton({super.key, required this.onPressed, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.getHight(divide: 0.07),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: color == null ? const WidgetStatePropertyAll(AppColors.primaryColor) : color!,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: appTheme.textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 15.sp),
        ),
      ),
    );
  }
}
