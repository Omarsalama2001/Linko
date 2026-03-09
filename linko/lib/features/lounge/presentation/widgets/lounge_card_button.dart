import 'package:Linko/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoungeCardButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const LoungeCardButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(CircleBorder()),
        backgroundColor: WidgetStatePropertyAll(
          AppColors.primaryColor.withOpacity(0.05),
        ),
        iconColor: const WidgetStatePropertyAll(Colors.white),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0.h),
        child: Icon(
          icon,
          size: 40.h,
        ),
      ),
    );
  }
}
