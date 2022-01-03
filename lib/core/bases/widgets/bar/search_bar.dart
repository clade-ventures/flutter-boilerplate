import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_strong_boilerplate/core/bases/decorators/input_decorator.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.hintText,
    this.padding,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String val)? onChanged;
  final String? hintText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: FontTheme.rubik14w400black1(),
        decoration: TextInputDecorator.searchBar().copyWith(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/icons/fi_search.svg',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
