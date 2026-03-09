import 'package:Linko/core/error/exeptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Linko/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDatasource {
  Future<UserModel> getuserProfileData();
}

class ProfileRemoteDatasourceWithFirebase extends ProfileRemoteDatasource {
  final FirebaseFirestore firebaseFirestore;
  ProfileRemoteDatasourceWithFirebase({
    required this.firebaseFirestore,
  });
  @override
  Future<UserModel> getuserProfileData() async {
    final UserModel userProfileData;
    try {
      final snapshots = await firebaseFirestore.collection('users').where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      userProfileData = UserModel.fromJson(snapshots.docs.first.data());
      print(snapshots.docs.first.data());
      if (snapshots.docs.isEmpty) {
        throw NoDataException();
      }
      return userProfileData;
    } on FirebaseException {
      throw ServerException();
    }
  }
}
