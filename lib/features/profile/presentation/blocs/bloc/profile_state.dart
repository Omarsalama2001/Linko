part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class GetUserProfileDataSuccessState extends ProfileState {
  final UserEntity profileUserData;

  const GetUserProfileDataSuccessState({required this.profileUserData});
}

final class GetUserProfileDataLoadingState extends ProfileState {}
final class GetUserProfileDataErrorState extends ProfileState {}

