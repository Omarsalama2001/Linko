import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/strings/faliures.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/core/widgets/snack_bar.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:Linko/features/auth/presentation/pages/signup_page.dart';
import 'package:Linko/features/auth/presentation/widgets/email_verification_sheet.dart';
import 'package:Linko/features/auth/presentation/widgets/google_signin_button.dart';
import 'package:Linko/features/auth/presentation/widgets/login_text_field.dart';
import 'package:Linko/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AnimationController _controller;
  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: Form(
          key: formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Login',
              style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 30.sp),
            ),
            Text(
              'Login to continue using the app',
              style: appTheme.textTheme.titleLarge!.copyWith(color: AppColors.greyColor, fontSize: 15.sp),
            ),
            SizedBox(
              height: context.getHight(divide: 0.03),
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Enter your email';
                }
              },
              hintText: "Enter your email",
            ),
            SizedBox(
              height: context.getHight(divide: 0.03),
            ),
            Text(
              "Password",
              style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp),
            ),
            SizedBox(
              height: context.getHight(divide: 0.009),
            ),
            LoginTextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscure,
                suffixpressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  }
                  return null;
                },
                hintText: "Enter your password",
                suffix: isObscure ? Icons.visibility : Icons.visibility_off),
            SizedBox(
              height: context.getHight(divide: 0.01),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                    },
                    child: Text("Forgot Password?", style: appTheme.textTheme.titleLarge!.copyWith(fontSize: 13.sp, color: AppColors.heavyGreyColor)))),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthErrorState) {
                _mapAuthErrorStateToAction(state, context: context);
              }
              if (state is AuthSuccessState) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
              }
              if (state is AuthEmailVerificationSentState) {
                Navigator.pop(context);
                SnackBarMessage.showSnackBar(SnackBarTypes.SUCCESS, state.successMessage, context);
              }
              if (state is AuthEmailVerificationFailedState) {
                Navigator.pop(context);
                SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, state.errorMessage, context);
              }
            }, builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return MainElevatedButton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthLoginEvent(email: emailController.text, password: passwordController.text));
                  }
                },
              );
            }),
            SizedBox(
              height: context.getHight(divide: 0.03),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.2.h,
                    color: AppColors.heavyGreyColor,
                  ),
                ),
                Text("Or Login with", style: appTheme.textTheme.titleLarge!.copyWith(fontSize: 13.sp, color: AppColors.heavyGreyColor)),
                Expanded(
                  child: Divider(
                    thickness: 0.2.h,
                    color: AppColors.heavyGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.getHight(divide: 0.03),
            ),
            GoogleSigninButton(onPressed: () {}),
            SizedBox(
              height: context.getHight(divide: 0.03),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: appTheme.textTheme.titleLarge!.copyWith(fontSize: 13.sp, color: AppColors.heavyGreyColor)),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupPage()));
                    },
                    child: Text("Sign Up", style: appTheme.textTheme.titleLarge!.copyWith(fontSize: 13.sp, color: AppColors.primaryColor))),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  _mapAuthErrorStateToAction(AuthErrorState state, {required BuildContext context}) {
    switch (state.errorMessage) {
      case EMAIL_NOT_VERIFIED_MESSAGE:
        buildVerificationSheet(context, _controller, emailController);
      case OFFLINE_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, OFFLINE_Failure_MESSAGE, context);
      case SERVER_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, SERVER_Failure_MESSAGE, context);
      case AUTH_Failure_MESSAGE:
        SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, AUTH_Failure_MESSAGE, context);
    }
  }
}
