import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/organisms/base_app_bar.dart';
import 'package:flutter_strong_boilerplate/core/theme/base_colors.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';
import 'package:flutter_strong_boilerplate/services/launch_service.dart';
import 'package:photo_view/photo_view.dart';

/// Custom image viewer
///
/// Don't forget to wrap the parent widget with hero to trigger hero animation
///
/// Example:
/// ```dart
/// GestureDetector(
///   onTap: () => nav.goToViewerPage(
///     type: ViewerType.image,
///     url: url,
///   );
///   child: Hero(
///     tag: url,
///     child: Image.network(url),
///   ),
/// );
/// ```
class ImageViewerPage extends StatelessWidget {
  const ImageViewerPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'Detail',
        centerTitle: false,
        backgroundColor: Colors.black,
        leadingColor: Colors.white,
        titleStyle: FontTheme.rubik14w500black1().copyWith(
          fontSize: 18,
          color: BaseColors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            color: BaseColors.white,
            onPressed: () {
              LaunchServices.launchInBrowser(url);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: PhotoView(
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            imageProvider: CachedNetworkImageProvider(url),
            heroAttributes: PhotoViewHeroAttributes(tag: url),
          ),
        ),
      ),
    );
  }
}
