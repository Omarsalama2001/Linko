part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetLiveUsersSuccessState extends HomeState {
  final List<UserEntity> liveUsers;
  const GetLiveUsersSuccessState({
    required this.liveUsers,
  });
}

final class GetLiveUsersErrorState extends HomeState {
  final String errorMessage;
  const GetLiveUsersErrorState({
    required this.errorMessage,
  });
}

final class GetLiveUsersLoadingState extends HomeState {}