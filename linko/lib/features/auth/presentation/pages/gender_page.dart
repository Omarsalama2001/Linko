import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/core/widgets/snack_bar.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/login_page.dart';
import 'package:Linko/features/auth/presentation/widgets/gender_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  bool isMale = false;
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
          "Iam a",
          style: appTheme.textTheme.headlineLarge!.copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        SizedBox(height: 10.h),
        GenderButton(
          !isMale,
          text: "Female",
          onPressed: () {
            setState(() {
              isMale = !isMale;
            });
          },
        ),
        SizedBox(height: 12.h),
        GenderButton(
          isMale,
          text: "Male",
          onPressed: () {
            setState(() {
              isMale = !isMale;
            });
          },
        ),
        const Spacer(),
        Text(
          "*why do we need this info?\nwe need this info to improve your match experience.\nplease make sure to check these as you won't be able to update these later!",
          style: appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.heavyGreyColor, fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSuccessState) {
            // ZIMKit().connectUser(id: FirebaseAuth.instance.currentUser!.uid, name: context.read<AuthBloc>().usernameController.text, avatarUrl:context.read<AuthBloc>().userImageUrl);

            context.read<AuthBloc>().emailController.clear();
            context.read<AuthBloc>().passwordController.clear();
            context.read<AuthBloc>().usernameController.clear();
            context.read<AuthBloc>().confirmPasswordController.clear();

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LogInPage()), (route) => false);
            SnackBarMessage.showSnackBar(SnackBarTypes.SUCCESS, state.successMessage, context);
          }
        }, builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return MainElevatedButton(
            text: "Register",
            onPressed: () {
              print(context.read<AuthBloc>().userCountryCode);
              UserEntity userEntity = UserEntity(name: context.read<AuthBloc>().usernameController.text, email: context.read<AuthBloc>().emailController.text, gender: isMale ? "Male" : "Female", birthDate: context.read<AuthBloc>().userBirthDate, photoUrl: context.read<AuthBloc>().userImageUrl, countryCode: context.read<AuthBloc>().userCountryCode);
              context.read<AuthBloc>().add(AuthSignUpEvent(
                    userEntity: userEntity,
                    password: context.read<AuthBloc>().passwordController.text,
                  ));
            },
          );
        }),
      ]),
    ));
  }
}
