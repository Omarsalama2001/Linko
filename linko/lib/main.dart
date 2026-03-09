
import 'package:Linko/core/utils/Localization/app_localization_setup.dart';
import 'package:Linko/core/utils/theme/cubit/theme_cubit.dart';
import 'package:Linko/env/env.dart';
import 'package:Linko/features/home/presentation/pages/home_page.dart';
import 'package:Linko/features/lounge/presentation/blocs/bloc/lounge_bloc.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:Linko/features/streaming/presentation/blocs/bloc/streaming_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Linko/bloc_observer.dart';
import 'package:Linko/core/constants/cache_keys.dart';
import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/auth/presentation/pages/login_page.dart';
import 'package:Linko/firebase_options.dart';
import 'package:Linko/injectionContainer.dart' as di;
import 'package:zego_zimkit/zego_zimkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ZIMKit().init(appID: Env.zegoChatAppId, appSign: Env.zegoChatAppSign);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  final bool isLoggedIn;
  await di.init();
  if (di.sl<SharedPreferences>().getString(TOKENID_KEY) == null) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(
      isLoggedIn: isLoggedIn,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return BlocProvider(
      create: (context) => di.sl<ProfileBloc>()..add(GetUserProfileDataEvent()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<ThemeCubit>()..getCurrentLocale()),
          BlocProvider(
            create: (context) => di.sl<AuthBloc>(),
          ),
          BlocProvider(create: (context) => di.sl<StreamingBloc>()),
          BlocProvider(create: (context) => di.sl<LoungeBloc>()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                locale: BlocProvider.of<ThemeCubit>(context).locale,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  return AppLocalizationsSetup.localeResolutionCallback(deviceLocale!, supportedLocales);
                },
                builder: DevicePreview.appBuilder,
                theme: appTheme,
                debugShowCheckedModeBanner: false,
                home: isLoggedIn ? const HomePage() : const LogInPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
