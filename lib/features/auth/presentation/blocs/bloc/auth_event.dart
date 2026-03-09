part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpEvent extends AuthEvent {
  final UserEntity userEntity;
  final String password;
  const AuthSignUpEvent({
    required this.userEntity,
    required this.password,
  });
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthSendEmailVerificationEvent extends AuthEvent {}

class UploadUserImageEvent extends AuthEvent {
  final File userImage;
  const UploadUserImageEvent({
    required this.userImage,
  });
}


class AuthLogoutEvent extends AuthEvent {}