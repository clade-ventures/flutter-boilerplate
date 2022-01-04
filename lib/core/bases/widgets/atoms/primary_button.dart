import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_strong_boilerplate/core/theme/base_colors.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';

/// A Primary Button.
class PrimaryButton extends StatelessWidget {
  /// Creates A Primary Button.
  ///
  /// the either both of [text] and [child] cannot be null or null.
  const PrimaryButton({
    Key? key,
    this.child,
    this.text,
    this.onPressed,
    this.borderRadius,
    this.width,
    this.height,
    this.isLoading = false,
    this.activeColor,
  })  : assert(text == null || child == null, 'One of them must be null.'),
        assert(child != null || text != null, 'One of them must not be null.'),
        super(key: key);

  /// If null describe this button is disabled.
  ///
  /// Defaults to null.
  final VoidCallback? onPressed;

  /// Either [child] or [text] must not be null.
  ///
  /// Specify child for dynamic content.
  final Widget? child;

  /// Whether button has text content.
  final String? text;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// Applies only to boxes with rectangular shapes; ignored if shape is not
  /// [BoxShape.rectangle].
  ///
  /// {@macro flutter.painting.BoxDecoration.clip}
  final BorderRadius? borderRadius;

  /// if non-null, this box button will use specific width.
  final double? width;

  /// if non-null, this box button will use specific width.
  final double? height;

  /// Whether button in loading state
  final bool isLoading;

  /// Active Color
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: enabled
            ? activeColor ?? BaseColors.primary
            : BaseColors.disableColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      height: height ?? 42,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              // padding: const EdgeInsets.all(8),
              child: isLoading
                  ? const SpinKitRing(
                      color: Colors.white,
                      size: 24,
                      lineWidth: 4,
                    )
                  : Text(
                      text.toString(),
                      style: FontTheme.rubik14w500white1(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
