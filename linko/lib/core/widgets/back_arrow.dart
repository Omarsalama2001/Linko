import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/utils/app_colors.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback onPressed;
  const BackArrow({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 35.h,
        width: 40.w,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(10.h),
            border: Border.all(
              color: AppColors.greyColor,
            )),
        child: Image.asset('lib/assets/icons/back_arrow.png'),
      ),
    );
  }
}
