import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final List<String> videoKeys;
  final int initialIndex;

  const VideoScreen({
    super.key,
    required this.videoKeys,
    required this.initialIndex,
  });

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late PageController _pageController;
  late List<YoutubePlayerController> _controllers;
  int _currentIndex = 0;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _initControllers();
  }

  void _initControllers() {
    _controllers = widget.videoKeys.map((video) {
      return YoutubePlayerController(
        initialVideoId: video,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          enableCaption: false,
          hideControls: false,
        ),
      );
    }).toList();
  }

  void _enterFullScreen() {
    setState(() => _isFullscreen = true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _exitFullScreen() {
    setState(() => _isFullscreen = false);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isFullscreen) {
          _exitFullScreen();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: widget.videoKeys.length,
                onPageChanged: (index) {
                  setState(() {
                    _controllers[_currentIndex].pause();
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final video = widget.videoKeys[index];
                  final controller = _controllers[index];

                  return Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: YoutubePlayer(
                          controller: controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                          progressColors: const ProgressBarColors(
                            playedColor: Colors.red,
                            handleColor: Colors.redAccent,
                          ),
                          actionsPadding: EdgeInsets.zero,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                            RemainingDuration(),
                            const PlaybackSpeedButton(),
                            FullScreenButton(),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (!_isFullscreen) ...[
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Text(
                    '${_currentIndex + 1}/${widget.videoKeys.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    for (var controller in _controllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }
}
