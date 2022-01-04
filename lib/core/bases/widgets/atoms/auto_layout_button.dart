import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// A decorated text button that expands in size (width).
class AutoLayoutButton extends StatelessWidget {
  /// Creates a [AutoLayoutButton].
  ///
  /// the [text] argument must not be null.
  const AutoLayoutButton({
    Key? key,
    this.text,
    this.textStyle,
    this.isLoading = false,
    this.onTap,
    this.backgroundColor,
    this.height,
    this.child,
  })  : assert(text == null || child == null, 'One of them must be null.'),
        assert(child != null || text != null, 'One of them must not be null.'),
        super(key: key);

  /// If non-null, the style to use for this text.
  ///
  /// otherwise the style will be inherited from textTheme.button.
  final TextStyle? textStyle;

  /// the text to display.
  final String? text;

  /// Whether this button in loading state.
  ///
  /// If true, the child will be display loading indicator.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Specify background color of button decoration
  ///
  /// If non-null, the backgroundColor to use for this button
  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? height;

  /// Either [child] or [text] must not be null.
  ///
  /// Specify child for dynamic content.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final theme = Theme.of(context);
    return Container(
      height: height ?? 46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: enabled
            ? backgroundColor ?? theme.primaryColor
            : theme.disabledColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child ??
              Center(
                child: isLoading
                    ? const SpinKitRing(
                        color: Colors.white,
                        size: 24,
                        lineWidth: 4,
                      )
                    : Text(
                        text!,
                        style: textStyle ??
                            theme.textTheme.button?.copyWith(
                              color: Colors.white,
                            ),
                      ),
              ),
        ),
      ),
    );
  }
}
