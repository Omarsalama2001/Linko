class UserEntity {
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? countryCode ;
  final String? gender;
  final DateTime? birthDate;
  String? uid;
  String? token;
  String? liveID = " ";
  bool? isLive = false;

  UserEntity({
    this.name,
    this.email,
    this.photoUrl,
    this.uid,
    this.gender,
    this.birthDate,
    this.token,
    this.liveID,
    this.isLive,
     this.countryCode,
  });
}
