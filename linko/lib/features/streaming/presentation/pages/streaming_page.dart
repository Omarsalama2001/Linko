import 'package:Linko/env/env.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:Linko/features/streaming/presentation/blocs/bloc/streaming_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class StreamingPage extends StatelessWidget {
  final String liveID;
  final bool isHost;
  const StreamingPage({super.key, required this.liveID, required this.isHost});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
            events: ZegoUIKitPrebuiltLiveStreamingEvents(
              onError: (p0) {
                context.read<StreamingBloc>().add(ChangeStreamStatusEvent(
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      status: false,
                    ));
                Navigator.pop(context);
              },
              onEnded: (event, defaultAction) {
                context.read<StreamingBloc>().add(ChangeStreamStatusEvent(uid: FirebaseAuth.instance.currentUser!.uid, status: false));
                if (!isHost) {
                  Navigator.pop(context);
                }
                return defaultAction();
              },
            ),
            appID: Env.zegoLiveStreamingAppId /*input your AppID*/,
            appSign: Env.zegoLiveStreamingAppSign /*input your AppSign*/,
            userID: FirebaseAuth.instance.currentUser!.uid,
            userName: context.read<ProfileBloc>().userProfileData!.name!,
            liveID: liveID,
            config: (isHost ? ZegoUIKitPrebuiltLiveStreamingConfig.host() : ZegoUIKitPrebuiltLiveStreamingConfig.audience())));
  }
}
