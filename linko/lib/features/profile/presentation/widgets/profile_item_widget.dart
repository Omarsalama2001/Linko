import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import 'package:Linko/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemWidget extends StatelessWidget {
  final IconData icon;

  final String title;
  final String subtitle;
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: AppColors.heavyGreyColor,
            size: 20.h,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.heavyGreyColor,
              fontSize: 15.sp,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Divider(
            color: AppColors.greyColor,
            thickness: 0.5.h,
          ),
        )
      ],
    );
  }
}
