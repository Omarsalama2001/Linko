import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.gender, required super.birthDate, required super.countryCode, super.photoUrl, super.uid, super.liveID, super.isLive, super.token});

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['birthDate'] = Timestamp.fromDate(birthDate!);
    data['photoUrl'] = photoUrl ?? "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg";
    data['uid'] = uid;
    data['liveID'] = liveID;
    data['isLive'] = isLive;
    data['countryCode'] = countryCode;
    data['token'] = token;

    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      birthDate: (json['birthDate'] as Timestamp).toDate(),
      photoUrl: json['photoUrl'] as String,
      uid: json['uid'] as String,
      liveID: json['liveID'] as String,
      isLive: json['isLive'] as bool,
      countryCode: json['countryCode'] as String,
      token: json['token'] as String,
    );
  }
}
