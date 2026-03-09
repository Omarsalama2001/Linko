part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String successMessage;

  const AuthSuccessState({required this.successMessage});
}

final class AuthErrorState extends AuthState {
  final String errorMessage;
  const AuthErrorState({required this.errorMessage});
}

final class AuthEmailVerificationSentState extends AuthState {
  final String successMessage;
  const AuthEmailVerificationSentState({required this.successMessage});
}

final class AuthEmailVerificationFailedState extends AuthState {
  final String errorMessage;
  const AuthEmailVerificationFailedState({required this.errorMessage});
}

final class UploadUserImageSuccessState extends AuthState {}

final class UploadUserImageErrorState extends AuthState {}

final class UploadUserImageLoadingState extends AuthState {}
