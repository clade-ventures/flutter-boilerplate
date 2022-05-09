import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../theme/base_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    this.url,
    this.placeHolder,
    this.borderRadius,
    this.fit,
  }) : super(key: key);

  final String? url;
  final Widget? placeHolder;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          image:
              DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover),
        ),
      ),
      placeholder: (_, __) =>
          placeHolder ??
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              color: BaseColors.disableColor,
            ),
          ),
      errorWidget: (_, __, dynamic ___) =>
          placeHolder ??
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              color: BaseColors.disableColor,
            ),
          ),
    );
  }
}
