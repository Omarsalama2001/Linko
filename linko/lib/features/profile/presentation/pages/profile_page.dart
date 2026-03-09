import 'package:Linko/core/extensions/translation_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:Linko/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:Linko/features/profile/presentation/widgets/settings_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity userProfileData = context.read<ProfileBloc>().userProfileData!;
    return Scaffold(
      drawer: const SettingsDrawerWidget(),
      body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 22.h,
                      ))
                ],
                title: Text(
                  context.translate('profile'),
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                expandedHeight: 205.h,
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 25.h,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80))),
                pinned: true,
                clipBehavior: Clip.antiAlias,
                backgroundColor: AppColors.primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // CircleAvatar(
                          //   radius: 40.h,
                          //   backgroundColor: Colors.white,
                          // ),
                          // CircleAvatar(
                          //   radius: 50.h,
                          //   backgroundColor: AppColors.primaryColor,
                          // ),
                          CircleAvatar(
                            radius: 55.h,
                            backgroundColor: Colors.transparent,
                            backgroundImage: CachedNetworkImageProvider(userProfileData.photoUrl!),
                          ),
                          CircleAvatar(
                            radius: 80.h,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('lib/assets/icons/profileframelvl1.png'),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(userProfileData.name!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0.sp,
                            )),
                        SizedBox(
                          width: 12.w,
                        ),
                        Icon(
                          Icons.flag,
                          color: Colors.white,
                          size: 20.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CountryFlag.fromCountryCode(
                          userProfileData.countryCode!,
                          theme: ImageTheme(
                            height: 20.h,
                            width: 30.w,
                            shape: const RoundedRectangle(2),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [ProfileItemWidget(icon: Icons.email_rounded, title: context.translate('email'), subtitle: userProfileData.email!), ProfileItemWidget(icon: userProfileData.gender! == "Female" ? Icons.female_outlined : Icons.male_outlined, title: context.translate('gender'), subtitle: userProfileData.gender!), ProfileItemWidget(icon: Icons.date_range_outlined, title: context.translate('birthdate'), subtitle: DateFormat('dd-MM-yyyy').format(userProfileData.birthDate!))],
          )),
    );
  }
}
