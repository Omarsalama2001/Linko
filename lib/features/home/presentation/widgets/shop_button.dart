import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Linko/core/extensions/translation_extension.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor, width: 1.w),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.0.h),
        child: Row(children: [
          Image.asset(
            'lib/assets/icons/diamond.png',
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            context.translate('shop'),
            style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp, color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
