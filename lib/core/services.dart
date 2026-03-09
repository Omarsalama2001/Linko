// lib/core/services/zimkit_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ZIMKitService {
  static Future<void> connectCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    
    if (user == null) {
      print("No user logged in, cannot connect to ZIMKit");
      return;
    }

    try {
      await ZIMKit().connectUser(
        id: user.uid,
        name: user.displayName ?? "User",
        avatarUrl: user.photoURL ?? "",
      );
      print("User connected to ZIMKit successfully");
    } catch (error) {
      print("Failed to connect user to ZIMKit: $error");
    }
  }

  static Future<void> disconnectUser() async {
    try {
      await ZIMKit().disconnectUser();
      print("User disconnected from ZIMKit");
    } catch (error) {
      print("Failed to disconnect from ZIMKit: $error");
    }
  }
}