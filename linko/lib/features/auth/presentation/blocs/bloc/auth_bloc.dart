import 'dart:io';

import 'package:Linko/core/strings/messages.dart';
import 'package:Linko/features/auth/domain/use_cases/user_logout_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/core/strings/faliures.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/auth/domain/use_cases/send_email_verification_usecase.dart';
import 'package:Linko/features/auth/domain/use_cases/user_login_with_email_and_password.dart';
import 'package:Linko/features/auth/domain/use_cases/user_signup_usercase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpUsecase userSignUpUsecase;
  final UserLoginWithEmailAndPasswordUseCase userLoginWithEmailAndPasswordUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final UserLogoutUsecase userLogoutUsecase;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  DateTime userBirthDate = DateTime.now();
  String userImageUrl = '';
  String userCountryCode = '';

  AuthBloc({required this.userSignUpUsecase, required this.userLoginWithEmailAndPasswordUseCase, required this.sendEmailVerificationUseCase, required this.userLogoutUsecase}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthSignUpEvent) {
        emit(AuthLoadingState());
        final either = await userSignUpUsecase(userEntity: event.userEntity, password: event.password);
        emit(_mapFailureOrUnitToState(either, Email_created_Success));
      }

      if (event is AuthLoginEvent) {
        emit(AuthLoadingState());
        final either = await userLoginWithEmailAndPasswordUseCase(email: event.email, password: event.password);
        emit(_mapFailureOrUnitToState(either, lOGGED_IN_SUCCESS));
      }

      if (event is AuthSendEmailVerificationEvent) {
        emit(AuthLoadingState());
        final either = await sendEmailVerificationUseCase();
        emit(either.fold((failure) => const AuthEmailVerificationFailedState(errorMessage: Verification_Email_failed), (unit) => const AuthEmailVerificationSentState(successMessage: Verification_Email_Sent)));
      }

      if (event is UploadUserImageEvent) {
        uploadImageFile(event.userImage);
      }

      if (event is AuthLogoutEvent) {
        emit(AuthLoadingState());
        final either = await userLogoutUsecase();
        emit(_mapFailureOrUnitToState(either, "Logout Success"));
      }
    });
  }
  Future uploadImageFile(
    File? image,
  ) async {
    final storageRef = FirebaseStorage.instance;
    // ignore: invalid_use_of_visible_for_testing_member
    emit(UploadUserImageLoadingState());
    if (image == null) return;
    final fileName = basename(image.path);
    final destination = 'files/$fileName';

    try {
      final ref = storageRef.ref('usersImages/').child(destination);
      await ref.putFile(image);
      userImageUrl = await ref.getDownloadURL();
      // ignore: invalid_use_of_visible_for_testing_member
      emit(UploadUserImageSuccessState());
    } catch (e) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(UploadUserImageErrorState());
    }
  }
}

Future<bool> isUsernameAvailable(String username) async {
  final snapshot = await FirebaseFirestore.instance.collection('users').where('name', isEqualTo: username).get();

  return snapshot.docs.isEmpty;
}

AuthState _mapFailureOrUnitToState(Either<Failure, Unit> either, String successMessage) {
  return either.fold((failure) => AuthErrorState(errorMessage: _mapfailureToMessage(failure)), (userEntity) => AuthSuccessState(successMessage: successMessage));
}

String _mapfailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_Failure_MESSAGE;
    case EmailNotVerifiedFailure:
      return EMAIL_NOT_VERIFIED_MESSAGE;
    case ConnectionFailure:
      return OFFLINE_Failure_MESSAGE;
    case AuthFailure:
      return AUTH_Failure_MESSAGE;
    default:
      return UN_EXCPECTED_ERROR_MESSAGE;
  }
}
