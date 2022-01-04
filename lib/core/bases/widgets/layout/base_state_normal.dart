import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/screen/sizing_information.dart';

abstract class BaseStateNormal {
  void init();

  PreferredSizeWidget? buildAppBar(BuildContext context);

  Widget buildNarrowLayout(
    BuildContext context,
    SizingInformation sizeInfo,
  );

  Widget buildWideLayout(
    BuildContext context,
    SizingInformation sizeInfo,
  );

  @protected
  Future<bool> onBackPressed();
}
