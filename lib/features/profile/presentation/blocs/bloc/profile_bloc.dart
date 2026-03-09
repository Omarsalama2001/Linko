import 'package:Linko/core/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/profile/domain/use_cases/get_user_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileDataUsecase getUserProfileDataUsecase;
  UserEntity? userProfileData;
  ProfileBloc(
    this.getUserProfileDataUsecase,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetUserProfileDataEvent) {
        emit(GetUserProfileDataLoadingState());
        final failureOrUserData = await getUserProfileDataUsecase();
        failureOrUserData.fold((failure) => emit(GetUserProfileDataErrorState()), (userEntity) {
          userProfileData = userEntity;
          emit(GetUserProfileDataSuccessState(profileUserData: userEntity));
          ZIMKitService.connectCurrentUser().then((_) {
            print("User connected to ZIMKit successfully");
          }).catchError((error) {
            print("Failed to connect user to ZIMKit: $error");
          });
        });
      }
    });
  }
}
