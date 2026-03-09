import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconData? suffix;
  final VoidCallback? suffixpressed;
  void Function(String)? onChanged;
  bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  LoginTextField({super.key, required this.hintText, this.controller, this.keyboardType, this.validator, this.suffix, this.suffixpressed, this.obscureText = false, this.inputFormatters, this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0.h),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.subTitleColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0.h),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.subTitleColor),
        ),
        suffixIcon: IconButton(
          onPressed: suffixpressed,
          icon: Icon(suffix, color: AppColors.heavyGreyColor, size: 20.h),
        ),
        contentPadding: EdgeInsets.all(context.getHight(divide: 0.015)),
        hintText: hintText,
        hintStyle: appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.greyColor, fontSize: 15.sp),
        filled: true,
        fillColor: AppColors.lightGreyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0.h),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.subTitleColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.subTitleColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(25.0.w),
        ),
      ),
    );
  }
}
