import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

buildVerificationSheet(context, AnimationController animationController, TextEditingController emailController) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.all(8.0.w),
            child: SizedBox(
                height: context.getHight(divide: 0.35),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Email Is Not Verified',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20.sp, color: AppColors.heavyGreyColor, fontWeight: FontWeight.w400),
                    ),
                    Lottie.asset('lib/assets/animations/email_verification.json', height: context.getHight(divide: 0.2), fit: BoxFit.fill),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.greyColor), elevation: WidgetStatePropertyAll(2.0)),
                          child: Text(
                            'cancel',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp, color: AppColors.primaryColor.withOpacity(0.4), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          style: const ButtonStyle(elevation: WidgetStatePropertyAll(2.0)),
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthSendEmailVerificationEvent());
                          },
                          child: Text(
                            'verify',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ])
                  ],
                )),
          ));
}
