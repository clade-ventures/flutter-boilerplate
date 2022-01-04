import 'package:flutter/material.dart';

/// A Ghost Button.
class GhostButton extends StatelessWidget {
  /// Creates A Ghost Button.
  ///
  /// the either both of [text] and [child] cannot be null or null.
  const GhostButton({
    Key? key,
    this.child,
    this.text,
    this.onPressed,
    this.borderRadius,
    this.width,
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

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final theme = Theme.of(context);
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text.toString(),
                style: theme.textTheme.button?.copyWith(
                  color:
                      enabled ? theme.colorScheme.primary : theme.disabledColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
