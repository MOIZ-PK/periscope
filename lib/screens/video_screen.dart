import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: '01abe69282894c0c996a366ff3312ac5',
        channelName: 'mychannel',
        tempToken:
            '00601abe69282894c0c996a366ff3312ac5IAA2JXloPhNkQZamyADT3/k6+vH8Xn3sUl8VZx5dHLKsQN+pr8cAAAAAEAAWylBUWsQQYgEAAQBYxBBi'),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
      Permission.bluetooth,
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
            ),
            AgoraVideoButtons(client: _client),
          ],
        ),
      ),
    );
  }
}
