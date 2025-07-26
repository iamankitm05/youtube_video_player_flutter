import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerDialog extends StatefulWidget {
  const YoutubePlayerDialog({
    super.key,
    required this.title,
    required this.videoId,
  });

  final String title;
  final String videoId;

  @override
  State<YoutubePlayerDialog> createState() => _YoutubePlayerDialogState();
}

class _YoutubePlayerDialogState extends State<YoutubePlayerDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(),
      insetPadding: EdgeInsets.all(16),
      child: YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        },
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
