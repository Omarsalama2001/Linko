import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/gender_page.dart';
import 'package:Linko/features/auth/presentation/pages/pick_country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  bool isDateSelected = false;

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
          "My birthday is",
          style: appTheme.textTheme.headlineLarge!.copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async {
            showDatePicker(
              barrierColor: AppColors.primaryColor.withOpacity(0.6),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((value) {
              setState(() {
                context.read<AuthBloc>().userBirthDate = value!;
                isDateSelected = true;
              });
            });
          },
          child: Text(
            "${context.read<AuthBloc>().userBirthDate.year}-${context.read<AuthBloc>().userBirthDate.month}-${context.read<AuthBloc>().userBirthDate.day}",
            style: appTheme.textTheme.headlineMedium!.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: isDateSelected ? Colors.black : AppColors.heavyGreyColor,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          "*why do we need this info?\nwe need this info to improve your match experience.\nplease make sure to check these as you won't be able to update these later!",
          style: appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.heavyGreyColor, fontSize: 13.sp),
        ),
        const Spacer(),
        MainElevatedButton(
          color: isDateSelected ? const WidgetStatePropertyAll(AppColors.primaryColor) : const WidgetStatePropertyAll(AppColors.greyColor),
          text: "Next",
          onPressed: () {
            if (isDateSelected) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PickCountryPage()));
            }
          },
        ),
      ]),
    ));
  }
}
