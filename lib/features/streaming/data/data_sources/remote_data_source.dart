import 'package:Linko/core/error/exeptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class StreamingRemoteDataSource {
  Future<Unit> startStreaming(String userID, bool status);
}

class RemoteDataSourceImplWithFirebase implements StreamingRemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSourceImplWithFirebase({required this.firestore});

  @override
  Future<Unit> startStreaming(String userID, bool status) {
    try {
      firestore.collection('users').doc(userID).update(<String, dynamic>{'isLive': status, 'liveID': status ? userID : ''});
      print('Live status updated successfully');
      return Future.value(unit);
    } on FirebaseException {
      print('Failed to update live status');
      throw ServerException();
    }
  }
}
