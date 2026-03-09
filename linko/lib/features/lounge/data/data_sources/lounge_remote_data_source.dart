import 'package:Linko/core/error/exeptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Linko/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoungeRemoteDataSource {
  Future<List<UserModel>> getLoungeUsers(String gender);
}

class LoungeRemoteDateSourceImplWithFirebase extends LoungeRemoteDataSource {
  FirebaseFirestore firebaseFirestore;
  LoungeRemoteDateSourceImplWithFirebase({
    required this.firebaseFirestore,
  });
  @override
  Future<List<UserModel>> getLoungeUsers(String gender) async {
    List<UserModel> loungeUsers = [];
    try {
      final snapshots = await firebaseFirestore.collection('users').where('email', isNotEqualTo: FirebaseAuth.instance.currentUser!.email).get();
      loungeUsers = snapshots.docs.map((user) => UserModel.fromJson(user.data())).toList();
      if (loungeUsers.isEmpty) {
        print('No users found in the lounge');
        throw NoDataException();
      }
      return loungeUsers;
    } on FirebaseException {
      throw ServerException();
    }
  }
}
