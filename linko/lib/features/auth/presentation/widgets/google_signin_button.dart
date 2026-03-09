import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';

class GoogleSigninButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleSigninButton({
    super.key,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0.h),
          border: Border.all(color: AppColors.subTitleColor, width: 1.5.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/icons/google_icon.png", width: 35.w, height: 35.h),
            SizedBox(
              width: 10.w,
            ),
            Text("Sign in with Google", style: appTheme.textTheme.titleLarge!.copyWith(fontSize: 13.sp, color: AppColors.heavyGreyColor)),
          ],
        ),
      ),
    );
  }
}
