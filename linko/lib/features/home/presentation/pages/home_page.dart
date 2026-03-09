import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:Linko/features/home/presentation/pages/live_page.dart';
import 'package:Linko/features/home/presentation/pages/messages_list.dart';
import 'package:Linko/features/home/presentation/widgets/shop_button.dart';

import 'package:Linko/features/lounge/presentation/pages/lounge_page.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:Linko/features/profile/presentation/pages/profile_page.dart';
import 'package:Linko/features/streaming/presentation/blocs/bloc/streaming_bloc.dart';
import 'package:Linko/injectionContainer.dart' as di;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:Linko/core/extensions/translation_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [const LivePage(), LoungePage(), const MessagesList()];
  final List<String> titles = ['Live', "Lounge", 'Messages'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<StreamingBloc>()),
        BlocProvider(create: (context) => di.sl<HomeBloc>()),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          selectedLabelStyle: appTheme.textTheme.bodySmall!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/icons/live.png',
                  height: 25.h,
                  width: 30.w,
                ),
                label: context.translate('live')),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/icons/lounge.png',
                  height: 30.h,
                  width: 30.w,
                ),
                label: context.translate('lounge')),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/assets/icons/messages.png",
                  height: 25.h,
                  width: 30.w,
                ),
                label: context.translate('messages')),
          ],
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is GetUserProfileDataSuccessState) {
                    return CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 18.h,
                      backgroundImage: CachedNetworkImageProvider(
                        context.read<ProfileBloc>().userProfileData!.photoUrl!,
                      ),
                    );
                  } else {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: CircleAvatar(
                          radius: 18.h,
                        ));
                  }
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              titles[currentIndex],
              style: appTheme.textTheme.headlineMedium!.copyWith(fontSize: 25.sp),
            ),
          ],
        ),
        actions: [
          // const ShopButton(),
          SizedBox(
            width: 10.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30.w,
            ),
            color: Colors.black,
          )
        ],
      );
}
