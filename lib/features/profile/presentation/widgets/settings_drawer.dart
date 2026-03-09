import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/cubit/theme_cubit.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/login_page.dart';
import 'package:Linko/features/profile/presentation/widgets/language_dialog_widget.dart';
import 'package:Linko/features/profile/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Linko/core/extensions/translation_extension.dart';

class SettingsDrawerWidget extends StatelessWidget {
  const SettingsDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.getWidth(divide: 0.7),
      elevation: 0.0,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.getHight(divide: 0.1),
            child: DrawerHeader(
                curve: Easing.legacy,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  border: null,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/icons/settings icon.png',
                        height: 20.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        context.translate('settings'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SettingsItemWidget(
            title: context.translate('dark_mode'),
            icon: Icons.mode_night_outlined,
            action: Switch(
              hoverColor: AppColors.greyColor,
              inactiveThumbColor: AppColors.greyColor,
              trackOutlineColor: const WidgetStatePropertyAll(AppColors.greyColor),
              value: true,
              onChanged: (_) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      context.translate(
                        "change_language",
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: const LangageDialogWidget(),
                  titlePadding: const EdgeInsets.all(15),
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  clipBehavior: Clip.values[3],
                ),
              );
            },
            child: SettingsItemWidget(
                title: context.translate('language'),
                icon: Icons.translate,
                action: Text(
                  context.read<ThemeCubit>().locale.toLanguageTag(),
                  style: TextStyle(fontSize: 12.sp),
                )),
          ),
          GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(AuthLogoutEvent());
              },
              child: SettingsItemWidget(
                  title: context.translate('logout'),
                  icon: Icons.logout_outlined,
                  action: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessState) {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LogInPage()), (Route<dynamic> route) => false);
                      }
                    },
                    builder: (context, state) {
                      return Text("");
                    },
                  )))
        ],
      ),
    );
  }
}
