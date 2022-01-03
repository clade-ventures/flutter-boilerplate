import 'package:flutter/material.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold({
    ScaffoldAttribute? attr,
    PreferredSizeWidget? appBar,
    Widget? body,
  }) : super(
          key: attr!.scaffoldKey,
          resizeToAvoidBottomInset: attr.resize,
          backgroundColor: attr.backgroundColor,
          floatingActionButton: attr.fab,
          floatingActionButtonLocation: attr.fabLocation,
          appBar: appBar,
          body: body,
          bottomNavigationBar: attr.bottomNavigation,
        );
}

/// Data from [CustomScaffold] accessible from its children.
class ScaffoldAttribute {
  /// Creates a [ScaffoldAttribute].
  ScaffoldAttribute({
    this.scaffoldKey,
    this.backgroundColor = Colors.white,
    this.resize = true,
    this.fabLocation,
    this.fab,
    this.bottomNavigation,
  });

  GlobalKey<ScaffoldState>? scaffoldKey;
  Color? backgroundColor;

  /// Whether layout is interactive to resize.
  ///
  /// Defaults to true.
  bool resize;
  FloatingActionButtonLocation? fabLocation;
  Widget? fab;
  Widget? bottomNavigation;
}
