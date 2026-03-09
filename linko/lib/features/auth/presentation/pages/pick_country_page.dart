import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/gender_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickCountryPage extends StatelessWidget {
  const PickCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.getHight(
            divide: 0.05,
          ),
          horizontal: 10.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackArrow(onPressed: () {}),
        SizedBox(height: 20.h),
        Text(
          "Pick your country",
          style: appTheme.textTheme.headlineLarge!.copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        SizedBox(height: 10.h),
        CountryCodePicker(
          hideMainText: true,
          flagWidth: 50.w,
          showDropDownButton: true,
          onInit: (countryCode) {
            context.read<AuthBloc>().userCountryCode = countryCode!.code!;
          },
          onChanged: (countryCode) {
            context.read<AuthBloc>().userCountryCode = countryCode.code!;
          },
        ),
        SizedBox(height: 20.h),
        Text(
          "*why do we need this info?\nwe need this info to improve your match experience.\nplease make sure to check these as you won't be able to update these later!",
          style: appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.heavyGreyColor, fontSize: 13.sp),
        ),
        const Spacer(),
        MainElevatedButton(
          color: const WidgetStatePropertyAll(AppColors.primaryColor),
          text: "Next",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const GenderPage()));
          },
        ),
      ]),
    ));
  }
}
