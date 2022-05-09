import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../theme/base_colors.dart';
import '../../../theme/font_theme.dart';
import '../atoms/global_icon.dart';
import '../atoms/height_size.dart';
import '../atoms/primary_button.dart';
import '../atoms/secondary_button.dart';
import '../atoms/width_size.dart';
import 'dialog_box.dart';

enum ConfirmationModalDialogType {
  info,
  warning,
}

class ConfirmationModalDialog extends DialogBox {
  const ConfirmationModalDialog({
    required this.title,
    required this.description,
    required this.yesLabel,
    required this.noLabel,
    this.type = ConfirmationModalDialogType.info,
  });

  final String title;
  final String description;
  final String yesLabel;
  final String noLabel;
  final ConfirmationModalDialogType type;

  @override
  Widget buildActions({
    VoidCallback? cancelAction,
    VoidCallback? confirmAction,
    Function()? additionalFunction,
    bool confirmEnable = true,
  }) {
    var isLoading = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          children: [
            Expanded(
              child: SecondaryButton(
                text: noLabel,
                onPressed: cancelAction ?? () => Navigator.pop(context, false),
                activeColor: BaseColors.primary,
                isBorder: true,
              ),
            ),
            const WidthSize(10),
            Expanded(
              child: PrimaryButton(
                text: yesLabel,
                isLoading: isLoading,
                onPressed: confirmAction ??
                    (additionalFunction != null
                        ? () async {
                            if (isLoading) {
                              return;
                            }
                            setState(() => isLoading = true);
                            await additionalFunction.call();
                          }
                        : () => Navigator.pop(context, true)),
                activeColor: type == ConfirmationModalDialogType.warning
                    ? BaseColors.danger
                    : BaseColors.primary,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildContent() {
    return Text(
      description,
      style: FontTheme.rubik16w400neutral(),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget buildHeader() {
    return Column(
      children: [
        GlobalIcon.svg(
          _mapAsset(type),
          height: 96,
          width: 96,
        ),
      ],
    );
  }

  String _mapAsset(ConfirmationModalDialogType type) {
    if (type == ConfirmationModalDialogType.info) {
      return 'info';
    } else if (type == ConfirmationModalDialogType.warning) {
      return 'warning';
    }
    return '';
  }

  Future<bool?> show() async {
    return showDialog<bool>(
      context: ctx!,
      builder: (_) => materialWithChild(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(),
            const HeightSize(15),
            buildContent(),
            const HeightSize(20),
            buildActions(),
          ],
        ),
        radius: 16,
      ),
    );
  }

  Future<bool?> showAsync({Function()? additionalFunction}) async {
    return showDialog<bool>(
      context: ctx!,
      builder: (_) => materialWithChild(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(),
            const HeightSize(15),
            buildContent(),
            const HeightSize(20),
            buildActions(
              additionalFunction: additionalFunction,
            ),
          ],
        ),
        radius: 16,
      ),
    );
  }
}
