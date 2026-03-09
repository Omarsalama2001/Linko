import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/cubit/theme_cubit.dart';
import 'package:Linko/injectionContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangageDialogWidget extends StatefulWidget {
  const LangageDialogWidget({super.key});

  @override
  State<LangageDialogWidget> createState() => _LangageDialogWidgetState();
}

class _LangageDialogWidgetState extends State<LangageDialogWidget> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getDefaultSize() * 15,
      width: context.getDefaultSize() * 38,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(
              "English",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: sl<SharedPreferences>().getInt('lang') ?? selectedValue,
              onChanged: (value) {
                setState(() {
                  sl<SharedPreferences>().setInt('lang', 1);

                  BlocProvider.of<ThemeCubit>(context).changeLocale(const Locale('en'));
                });
              },
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              toggleable: true,
            ),
          ),
          // const CustomDividerWidget(thickness: 1.0, whiteSpaceBegin: 15),
          ListTile(
            title: const Text("العربية", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Radio<int>(
              value: 2,
              groupValue: sl<SharedPreferences>().getInt('lang') ?? selectedValue,
              onChanged: (value) {
                setState(() {
                  sl<SharedPreferences>().setInt('lang', 2);
                  BlocProvider.of<ThemeCubit>(context).changeLocale(const Locale('ar'));
                });
              },
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              toggleable: true,
            ),
          ),
        ],
      ),
    );
  }
}
