import 'package:Linko/core/error/exeptions.dart';
import 'package:Linko/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeRemoteDataSource {
  Future<List<UserModel>> getLiveUsers();
}

class HomeRemoteDataSourceImplWithFirebase implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;
  HomeRemoteDataSourceImplWithFirebase({
    required this.firestore,
  });

  @override
  Future<List<UserModel>> getLiveUsers() async {
    final List<UserModel> liveUSers;
    try {
      final snapshots = await firestore.collection('users').where('isLive', isEqualTo: true).get();
      liveUSers = snapshots.docs.map((e) => UserModel.fromJson(e.data())).toList();

      if (liveUSers.isEmpty) {
        throw NoDataException();
      }
      return liveUSers;
    } on FirebaseException {
      throw ServerException();
    }
  }
}
