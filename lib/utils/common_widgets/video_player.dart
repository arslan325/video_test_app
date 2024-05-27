// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  String id;
  VideoApp({
    super.key,
    required this.id,
  });

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    bool isVideoPlaying = false;
    void videoListener() {
      if (_controller.value.isPlaying != isVideoPlaying) {
        setState(() {
          isVideoPlaying = _controller.value.isPlaying;
        });
      }
      if (!_controller.value.isPlaying && isVideoPlaying) {
        print('Video Finished');
        Get.back();
      }
    }

    _controller.toggleFullScreenMode();
    _controller.addListener(videoListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(listener);
          },
        ),
      ),
    );
  }

  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose() {
    // ignore: unnecessary_statements
    _controller.value.isFullScreen ? _controller.toggleFullScreenMode() : null;
    super.dispose();
    _controller.dispose();
  }
}
