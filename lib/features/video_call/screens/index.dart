import 'dart:math';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reve_grand_tast/core/utilities/utilities.dart';
import 'package:reve_grand_tast/features/video_call/screens/call.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRoleType? _role = ClientRoleType.clientRoleBroadcaster;
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: Utilities.screenHeight * 0.04,
              ),
              Image.network(
                  "https://img.freepik.com/free-vector/friends-video-calling_52683-37086.jpg?w=740&t=st=1678377152~exp=1678377752~hmac=ddd7859a02ebc213f93c467ba63deac15487068f44099f59c9eb873aa1b4a18c"),
              SizedBox(
                height: Utilities.screenHeight * 0.02,
              ),
              TextField(
                controller: _channelController,
                decoration: InputDecoration(
                    errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Channel name'),
              ),
              RadioListTile(
                title: const Text('Broadcaster'),
                value: ClientRoleType.clientRoleBroadcaster,
                groupValue: _role,
                onChanged: (value) {
                  setState(() {
                    _role = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Audience'),
                value: ClientRoleType.clientRoleAudience,
                groupValue: _role,
                onChanged: (value) {
                  setState(() {
                    _role = value;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: onJoin,
                  style: ElevatedButton.styleFrom(
                      maximumSize:
                          Size(double.infinity, Utilities.screenHeight * 0.04)),
                  child: const Text('Join'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status.toString());
  }
}
