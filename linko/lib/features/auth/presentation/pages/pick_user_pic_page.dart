import 'dart:io';

import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/back_arrow.dart';
import 'package:Linko/core/widgets/main_elevated_button.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/birthday_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickUserPicPage extends StatefulWidget {
  PickUserPicPage({super.key});

  @override
  State<PickUserPicPage> createState() => _PickUserPicPageState();
}

class _PickUserPicPageState extends State<PickUserPicPage> {
  final ImagePicker picker = ImagePicker();
  bool isImageSelected = false;

  XFile? image = XFile('');

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UploadUserImageSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BirthdayPage()));
        }
        if (state is UploadUserImageErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Something went wrong"),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.getHight(
              divide: 0.05,
            ),
            horizontal: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(alignment: Alignment.topLeft, child: BackArrow(onPressed: () {})),
          SizedBox(height: 20.h),
          Text(
            "Pick Your Profile Picture",
            style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 30.sp),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () async {
              image = await picker.pickImage(source: ImageSource.gallery).whenComplete(() => setState(() {
                    isImageSelected = true;
                  }));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 105,
                  backgroundColor: AppColors.primaryColor,
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: isImageSelected ? FileImage(File(image!.path)) : const AssetImage("lib/assets/icons/user_icon.png"),
                ),
              ],
            ),
          ),
          const Spacer(),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is UploadUserImageLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              return MainElevatedButton(
                color: const WidgetStatePropertyAll(AppColors.primaryColor),
                text: "Next",
                onPressed: () {
                  context.read<AuthBloc>().add(UploadUserImageEvent(userImage: File(image!.path)));
                },
              );
            },
          ),
        ]),
      )),
    );
  }
}
