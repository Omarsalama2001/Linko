part of 'lounge_bloc.dart';

sealed class LoungeState extends Equatable {
  const LoungeState();

  @override
  List<Object> get props => [];
}

final class LoungeInitial extends LoungeState {}

final class GetLoungeUsersLoadingState extends LoungeState {}

final class GetLoungeUsersSuccessState extends LoungeState {
  final List<UserEntity> loungeUsers;

  const GetLoungeUsersSuccessState({required this.loungeUsers});
}

final class GetLoungeUsersErrorState extends LoungeState {
  final String errorMessage;

  const GetLoungeUsersErrorState({required this.errorMessage});
}
