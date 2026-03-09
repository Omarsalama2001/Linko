import 'package:Linko/features/streaming/presentation/pages/streaming_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:country_flags/country_flags.dart';

class LiveItem extends StatelessWidget {
  final UserEntity userEntity;
  const LiveItem({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StreamingPage(
                      isHost: false,
                      liveID: userEntity.liveID!,
                    )));
      },
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20.h),
            child: CachedNetworkImage(
              imageUrl: userEntity.photoUrl ?? '',
              fit: BoxFit.cover,
            )),
        //  Positioned(
        //    top: 10.h,
        //    left: 10.h,
        //    height: 20.h,
        //    child: Container(
        //        decoration: BoxDecoration(
        //          borderRadius: BorderRadius.all(Radius.circular(10.h)),
        //          color: Colors.black.withOpacity(0.4),
        //        ),
        //        child: Padding(
        //          padding: EdgeInsets.symmetric(horizontal: 7.0.h),
        //          child: Row(
        //            mainAxisAlignment: MainAxisAlignment.center,
        //            mainAxisSize: MainAxisSize.min,
        //            children: [
        //              Icon(
        //                Icons.remove_red_eye,
        //                size: 20.h,
        //                color: Colors.white,
        //              ),
        //              SizedBox(width: 3.h),
        //              Text(
        //                '50',
        //                maxLines: 1,
        //                overflow: TextOverflow.ellipsis,
        //                style: TextStyle(color: Colors.white, fontSize: 15.sp),
        //              )
        //            ],
        //          ),
        //        )),
        //  ),
        Positioned(
          bottom: 3.h,
          left: 8.w,
          height: 40.h..h,
          child: Row(
            children: [
              CircleAvatar(
                radius: 12.h,
                backgroundImage: NetworkImage(
                  userEntity.photoUrl ?? '',
                ),
              ),
              SizedBox(width: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userEntity.name!,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 15.sp, color: Colors.white),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CountryFlag.fromCountryCode(
                      userEntity.countryCode!,
                      theme: ImageTheme(
                        height: 15.h,
                        width: 20.w,
                        shape: const RoundedRectangle(2),
                      ),
                    ),
                    SizedBox(width: 5.h),
                    Text(userEntity.countryCode!, style: appTheme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.white))
                  ])
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
