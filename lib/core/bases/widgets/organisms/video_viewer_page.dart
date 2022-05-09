import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import '../../../../services/launch_service.dart';
import '../../../theme/base_colors.dart';
import '../../../theme/font_theme.dart';
import 'base_app_bar.dart';

/// Custom video viewer
///
/// Example:
/// ```dart
/// nav.goToViewerPage(
///   type: ViewerType.video,
///   url: url,
/// );
/// ```
class VideoViewerPage extends StatefulWidget {
  const VideoViewerPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  _VideoViewerPageState createState() => _VideoViewerPageState();
}

class _VideoViewerPageState extends State<VideoViewerPage> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.url,
    );
    _controller = BetterPlayerController(
      const BetterPlayerConfiguration(
        fit: BoxFit.contain,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'Detail',
        centerTitle: false,
        backgroundColor: Colors.black,
        titleStyle: FontTheme.rubik14w500black1().copyWith(
          fontSize: 18,
          color: BaseColors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            color: BaseColors.white,
            onPressed: () {
              LaunchServices.launchInBrowser(widget.url);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: BetterPlayer(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}
