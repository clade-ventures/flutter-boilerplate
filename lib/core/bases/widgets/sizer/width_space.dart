import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/sizer/sizer.dart';

class WidthSize extends StatelessWidget implements Sizer {
  const WidthSize(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: getSize());
  }

  @override
  double getSize() {
    return size;
  }
}
