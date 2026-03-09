import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/features/auth/presentation/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getDefaultSize(), vertical: context.getDefaultSize() * 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrow(
                onPressed: () {},
              ),
              Image.asset(
                'lib/assets/images/forgot_password_image.png',
                height: context.getHight(divide: 0.4),
                width: double.infinity,
              ),
              Text('Forgot Password?', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 30.sp)),
              SizedBox(
                height: context.getHight(divide: 0.02),
              ),
              Text(
                'Dont worry it occurs ,please enter the email address linked with your account.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.heavyGreyColor, fontWeight: FontWeight.w500, fontSize: 13.sp),
              ),
              SizedBox(
                height: context.getHight(divide: 0.02),
              ),
              Text(
                "Email",
                style: appTheme.textTheme.headlineMedium!.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: context.getHight(divide: 0.009),
              ),
              LoginTextField(
                hintText: "Enter your email",
              ),
              SizedBox(
                height: context.getHight(divide: 0.03),
              ),
              MainElevatedButton(
                text: 'send email',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
