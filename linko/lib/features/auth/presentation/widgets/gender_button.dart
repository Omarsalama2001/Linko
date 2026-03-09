import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';

// ignore: must_be_immutable
class GenderButton extends StatelessWidget {
  final String text;
  bool isSelected;
  final VoidCallback onPressed;

  GenderButton(
    this.isSelected, {
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(133, 206, 212, 220),
          borderRadius: BorderRadius.circular(10.h),
          border: isSelected ? Border.all(color: AppColors.primaryColor, width: 0.9.w) : null,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: Text(text, style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
