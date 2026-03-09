import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/features/lounge/presentation/pages/chatting_page.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_flags/country_flags.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/lounge/presentation/widgets/lounge_card_button.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class LoungePageCard extends StatelessWidget {
  final UserEntity loungeUSer;
  const LoungePageCard({
    super.key,
    required this.loungeUSer,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0.h)), // Use a fixed value
            image: DecorationImage(
              image: CachedNetworkImageProvider(loungeUSer.photoUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "${loungeUSer.name} , ${loungeUSer.gender}",
                    style: appTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.h, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  CountryFlag.fromCountryCode(
                    loungeUSer.countryCode!,
                    theme: ImageTheme(
                      height: 20.h,
                      width: 30.w,
                      shape: const RoundedRectangle(2),
                    ),
                    // height: 20.h,
                    // width: 30.w,
                    // shape: const RoundedRectangle(2),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    loungeUSer.countryCode!,
                    style: appTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.h, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoungeCardButton(
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => const ChattingPage()));
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ZIMKitMessageListPage(
                            conversationID: loungeUSer.uid!,
                            appBarBuilder: (context, defaultAppBar) {
                              return AppBar(
                                surfaceTintColor: Colors.transparent,
                                title: defaultAppBar.title,
                                backgroundColor: AppColors.backgroundColor,
                                iconTheme: const IconThemeData(color: Colors.black),
                              );
                            },
                          );
                        }));
                      },
                      icon: Icons.chat_bubble_outline_outlined)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
