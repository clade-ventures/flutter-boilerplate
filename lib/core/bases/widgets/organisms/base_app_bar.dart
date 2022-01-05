import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/app.dart';
import 'package:flutter_strong_boilerplate/core/theme/base_colors.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    Key? key,
    String title = '',
    TextStyle? titleStyle,
    List<Widget>? actions,
    IconData icon = Icons.arrow_back,
    Function()? additionalFunction,
    Function()? onBackFunction,
    PreferredSizeWidget? bottom,
    bool centerTitle = true,
    Widget? flexibleSpace,
    Color? leadingColor,
    Color? backgroundColor,
  }) : super(
          key: key,
          title: Text(
            title,
            style: titleStyle ??
                FontTheme.rubik14w500black1().copyWith(fontSize: 18),
          ),
          leading: IconButton(
            icon: Icon(icon),
            color: leadingColor ?? BaseColors.neutral70,
            onPressed: () {
              if (onBackFunction == null) {
                if (additionalFunction != null) {
                  additionalFunction();
                }
                nav.pop<void>();
              } else {
                onBackFunction();
              }
            },
          ),
          actions: actions,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor ?? Colors.white,
          shadowColor: Colors.grey.withOpacity(.2),
          bottom: bottom,
          flexibleSpace: flexibleSpace,
        );
}
