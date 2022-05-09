import 'package:flutter/material.dart';
import '../../../theme/font_theme.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    Key? key,
    String title = '',
    TextStyle? titleStyle,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    bool centerTitle = true,
    Widget? flexibleSpace,
    Color? backgroundColor,
    Widget? leading,
  }) : super(
          key: key,
          title: Text(
            title,
            style: titleStyle ??
                FontTheme.rubik14w500black1().copyWith(fontSize: 18),
          ),
          leading: leading,
          actions: actions,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor ?? Colors.white,
          shadowColor: Colors.grey.withOpacity(.2),
          bottom: bottom,
          flexibleSpace: flexibleSpace,
        );
}
