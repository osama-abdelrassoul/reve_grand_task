import 'dart:ffi';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:reve_grand_tast/features/video_call/utils/settings.dart';

class CallScreen extends StatefulWidget {
  final String? channelName;
  final ClientRoleType? clientRoleType;
  const CallScreen({super.key, this.channelName, this.clientRoleType});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final _users = <int>[];
  final _infoString = <String>[];
  bool mutes = false;
  bool viewPanel = false;
  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();

    super.dispose();
  }

  Future<Void?> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infoString.add("App Id missing, please provide the app id");
      });
      _infoString.add("Agora Engine is not starting");

      return null;
    }
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: widget.channelName!,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.channelName!),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
