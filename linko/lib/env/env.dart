import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/.env')
abstract class Env {
    @EnviedField(varName: 'ZEGO_CHAT_APP_ID')
    static const int zegoChatAppId = _Env.zegoChatAppId;

    @EnviedField(varName: 'ZEGO_CHAT_APP_SIGN')
    static const String zegoChatAppSign = _Env.zegoChatAppSign;
   @EnviedField(varName: 'ZEGO_LIVE_STREAMING_APP_ID')
  static const int zegoLiveStreamingAppId = _Env.zegoLiveStreamingAppId;
   @EnviedField(varName: 'ZEGO_LIVE_STREAMING_APP_SIGN')
  static const String zegoLiveStreamingAppSign = _Env.zegoLiveStreamingAppSign;

}