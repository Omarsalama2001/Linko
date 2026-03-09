import 'package:Linko/core/network/network_info.dart';
import 'package:Linko/core/utils/theme/cubit/theme_cubit.dart';
import 'package:Linko/features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:Linko/features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:Linko/features/auth/data/repositories_impl/auth_repo_impl.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';
import 'package:Linko/features/auth/domain/use_cases/send_email_verification_usecase.dart';
import 'package:Linko/features/auth/domain/use_cases/user_login_with_email_and_password.dart';
import 'package:Linko/features/auth/domain/use_cases/user_logout_usecase.dart';
import 'package:Linko/features/auth/domain/use_cases/user_signup_usercase.dart';
import 'package:Linko/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:Linko/features/home/data/data_sources/home_remote_datasource.dart';
import 'package:Linko/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:Linko/features/home/domain/repositories/home_repository.dart';
import 'package:Linko/features/home/domain/use_cases/get_live_users_usecase.dart';
import 'package:Linko/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:Linko/features/lounge/data/data_sources/lounge_remote_data_source.dart';
import 'package:Linko/features/lounge/data/repositories_impl/lounge_repository_impl.dart';
import 'package:Linko/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:Linko/features/lounge/domain/use_cases/get_lounge_users_usecase.dart';
import 'package:Linko/features/lounge/presentation/blocs/bloc/lounge_bloc.dart';
import 'package:Linko/features/profile/data/data_sources/profile_remote_datasource.dart';
import 'package:Linko/features/profile/data/repositories_impl/profile_repository_impl.dart';
import 'package:Linko/features/profile/domain/repositories/profile_repository.dart';
import 'package:Linko/features/profile/domain/use_cases/get_user_profile_usecase.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:Linko/features/streaming/data/data_sources/remote_data_source.dart';
import 'package:Linko/features/streaming/data/repositories_impl/streaming_repository_impl.dart';
import 'package:Linko/features/streaming/domain/repositories/streaming_repository.dart';
import 'package:Linko/features/streaming/domain/use_cases/change_stream_status_usecase.dart';
import 'package:Linko/features/streaming/presentation/blocs/bloc/streaming_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
//!features - signIn

//Bloc
  sl.registerFactory(() => AuthBloc(
        userSignUpUsecase: sl(),
        userLoginWithEmailAndPasswordUseCase: sl(),
        sendEmailVerificationUseCase: sl(),
        userLogoutUsecase: sl(),
      ));
  sl.registerFactory(() => StreamingBloc(changeStreamStatusUsecase: sl()));
  sl.registerFactory(() => HomeBloc(getLiveUsersUsecase: sl()));
  sl.registerFactory(() => LoungeBloc(sl()));
  sl.registerFactory(() => ProfileBloc(sl()));
  sl.registerFactory(() => ThemeCubit(sl()));

//UseCases
  // sl.registerLazySingleton(() => UserLoginUseCase(authRepository: sl()));
  // sl.registerLazySingleton(() => ResetPasswordUseCase(authRepository: sl()));
  // sl.registerLazySingleton(() => UserLogOutUseCase(authRepository: sl()));
  // sl.registerLazySingleton(() => SaveAdditionalUserdataUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetLiveUsersUsecase(homeRepository: sl()));
  sl.registerLazySingleton(() => SendEmailVerificationUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ChangeStreamStatusUsecase(streamingRepository: sl()));

  sl.registerLazySingleton(() => UserLoginWithEmailAndPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => UserSignUpUsecase(authRepository: sl()));

  sl.registerLazySingleton(() => GetLoungeUsersUsecase(loungeRepository: sl()));
  sl.registerLazySingleton(() => GetUserProfileDataUsecase(profileRepository: sl()));
  sl.registerLazySingleton(() => UserLogoutUsecase(authRepository: sl()));

//Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImpl(networkInfo: sl(), authRemoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<StreamingRepository>(() => StreamingRepositoryImpl(streamingRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(networkInfo: sl(), homeRemoteDataSource: sl()));
  sl.registerLazySingleton<LoungeRepository>(() => LoungeRepositoryImpl(networkInfo: sl(), loungeRemoteDataSource: sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(networkInfo: sl(), profileRemoteDatasource: sl()));

//DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(localDataSource: sl(), firestore: sl(), firebaseAuth: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<StreamingRemoteDataSource>(() => RemoteDataSourceImplWithFirebase(firestore: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImplWithFirebase(firestore: sl()));
  sl.registerLazySingleton<LoungeRemoteDataSource>(() => LoungeRemoteDateSourceImplWithFirebase(firebaseFirestore: sl()));
  sl.registerLazySingleton<ProfileRemoteDatasource>(() => ProfileRemoteDatasourceWithFirebase(firebaseFirestore: sl()));
//Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));

//External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // sl.registerLazySingleton(() => firebaseMessaging);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);

  sl.registerLazySingleton(() => InternetConnection());
}
