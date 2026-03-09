import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/birthday_page.dart';
import 'package:Linko/features/auth/presentation/pages/pick_user_pic_page.dart';
import 'package:Linko/features/auth/presentation/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool passwordIsObscure = true;
  bool confirmPasswordIsObscure = true;
  bool isDistnictUsername = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Stack(children: [
        Positioned(
            top: context.getHight(
              divide: 0.05,
            ),
            left: context.getWidth(divide: 0.04),
            child: BackArrow(onPressed: () {})),
        Padding(
          padding: EdgeInsets.all(12.h),
          child: Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Register',
                style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 30.sp),
              ),
              Text(
                'Enter Your Personal information',
                style: appTheme.textTheme.titleLarge!.copyWith(color: AppColors.greyColor, fontSize: 15.sp),
              ),
              SizedBox(
                height: context.getHight(divide: 0.01),
              ),
              Text(
                "Username",
                style: appTheme.textTheme.headlineMedium!.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: context.getHight(divide: 0.009),
              ),
              LoginTextField(
                errorText: isDistnictUsername ? null : "Username already exists",
                onChanged: (name) async {
                  isDistnictUsername = await isUsernameAvailable(name);
                  setState(() {});
                },
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your name";
                  }
                  if (isDistnictUsername) {}

                  return null;
                },
                controller: context.read<AuthBloc>().usernameController,
                hintText: "Enter your name",
              ),
              SizedBox(
                height: context.getHight(divide: 0.01),
              ),
              Text(
                "Email",
                style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(
                height: context.getHight(divide: 0.009),
              ),
              LoginTextField(
                controller: context.read<AuthBloc>().emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your email";
                  }
                  return null;
                },
                hintText: "Enter your email",
              ),
              SizedBox(
                height: context.getHight(divide: 0.01),
              ),
              Text(
                "Password",
                style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(
                height: context.getHight(divide: 0.009),
              ),
              LoginTextField(
                  controller: context.read<AuthBloc>().passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passwordIsObscure,
                  suffixpressed: () {
                    setState(() {
                      passwordIsObscure = !passwordIsObscure;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                  hintText: "Enter your password",
                  suffix: passwordIsObscure ? Icons.visibility : Icons.visibility_off),
              SizedBox(
                height: context.getHight(divide: 0.01),
              ),
              Text(
                "Confirm Password",
                style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(
                height: context.getHight(divide: 0.009),
              ),
              LoginTextField(
                controller: context.read<AuthBloc>().confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: confirmPasswordIsObscure,
                suffix: confirmPasswordIsObscure ? Icons.visibility : Icons.visibility_off,
                suffixpressed: () {
                  setState(() {
                    confirmPasswordIsObscure = !confirmPasswordIsObscure;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your confirm password";
                  }
                  if (value != context.read<AuthBloc>().passwordController.text) {
                    return "Password does not match";
                  }
                  return null;
                },
                hintText: "Enter confirm password",
              ),
              SizedBox(
                height: context.getHight(divide: 0.03),
              ),
              MainElevatedButton(
                text: 'Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isDistnictUsername) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PickUserPicPage()));
                    }
                  }
                },
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
