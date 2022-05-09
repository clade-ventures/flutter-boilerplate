import 'package:flutter/material.dart';

import '../../../theme/base_colors.dart';
import '../../../theme/font_theme.dart';
import '../atoms/width_size.dart';

class LoadingTypeBar extends StatelessWidget {
  const LoadingTypeBar({
    Key? key,
    required this.onChanged,
    this.selectedIndex = 0,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              onChanged.call(0);
            },
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _mapContainerColor(0),
                border: Border.all(
                  color: _mapBorderColor(0),
                ),
              ),
              child: Center(
                child: Text(
                  'Lazy Loading',
                  style: FontTheme.rubik14w500black1().copyWith(
                    color: _mapFontColor(0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const WidthSize(10),
        Expanded(
          child: InkWell(
            onTap: () async {
              onChanged.call(1);
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _mapContainerColor(1),
                border: Border.all(
                  color: _mapBorderColor(1),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Center(
                child: Text(
                  'With Index',
                  style: FontTheme.rubik14w500black1().copyWith(
                    color: _mapFontColor(1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _mapBorderColor(int index) {
    return selectedIndex == index
        ? BaseColors.primary
        : BaseColors.disableColor;
  }

  Color _mapContainerColor(int index) {
    return selectedIndex == index ? BaseColors.primary : BaseColors.white;
  }

  Color? _mapFontColor(int index) {
    return selectedIndex == index ? BaseColors.white : null;
  }
}
