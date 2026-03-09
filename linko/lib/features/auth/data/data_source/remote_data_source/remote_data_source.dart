import 'package:Linko/core/error/exeptions.dart';
import 'package:Linko/features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:Linko/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSource {
  // Future<UserModel> login({required bool isGoogle});
  Future<String?> loginWithEmailAndPassword(String email, String password);
  Future<Unit> saveAdditionalUserData(String adress, String phoneNumber, String fcmToken);
  Future<Unit> sendEmailVerification();
  Future<Unit> sendPasswordResetEmail({required String email});
  Future<Unit> signUp({required UserModel userModel, required String password});
  Future<Unit> logOut();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  LocalDataSource localDataSource;
  FirebaseFirestore firestore;
  FirebaseAuth firebaseAuth;

  RemoteDataSourceImpl({
    required this.localDataSource,
    required this.firestore,
    required this.firebaseAuth,
  });
  @override
  // Future<UserModel> login({required bool isGoogle}) async {
  //   UserCredential userCredential;
  //   try {
  //     userCredential = isGoogle ? await signInWithGoogle() : await signInWithFacebook();
  //   } catch (error) {
  //     throw ServerException();
  //   }
  //   final UserModel userModel = UserModel(name: userCredential.user!.displayName, email: userCredential.user!.email, photoUrl: userCredential.user!.photoURL, idToken: await userCredential.user!.getIdToken(), accessToken: userCredential.credential!.accessToken, userId: userCredential.user!.uid, fcmToken: '');

  //   return Future.value(userModel);
  // }

  @override
  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.emailVerified) {
        return userCredential.user!.getIdToken();
      } else {
        throw EmailNotVerifiedException();
      }
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> signUp({required UserModel userModel, required String password}) async {
    try {
      print(userModel.toJson());
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: userModel.email!, password: password);
      userModel.uid = userCredential.user!.uid;
      userModel.token = await userCredential.user!.getIdToken();
      await firestore.collection('users').doc(userModel.uid).set(userModel.toJson());
      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser!.sendEmailVerification();
      firebaseAuth.currentUser!.reload();
      return unit;
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize();

    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // Future<UserCredential> signInWithFacebook() async {
  //   // have some problems here
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['public_profile']);

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Future<Unit> saveAdditionalUserData(String adress, String phoneNumber, String fcmToken) {
    firestore.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set(<String, dynamic>{'address': adress, 'fcmToken': fcmToken, 'phoneNumber': phoneNumber});
    return Future.value(unit);
  }

  @override
  @override
  Future<Unit> logOut() async {
    try {
      await firebaseAuth.signOut();
      return Future.value(unit);
    } on FirebaseException {
      throw (ServerException());
    }
  }
}
