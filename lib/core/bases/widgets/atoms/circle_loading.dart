import 'package:flutter/material.dart';

/// A circle loading widget.
class CircleLoading extends StatelessWidget {
  /// Creates a circle loading with default size 35.
  const CircleLoading({
    Key? key,
    this.size = 35.0,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
