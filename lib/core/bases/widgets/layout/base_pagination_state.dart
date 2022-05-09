import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../screen/sizing_information.dart';
import '../../../screen/sizing_information_builder.dart';
import '../molecules/custom_scaffold.dart';
import 'base_state_normal.dart';

/// Note: When using this base pagination state, inside initState please call
/// super.initState() first
abstract class BasePaginationState<T extends StatefulWidget, K> extends State<T>
    with Diagnosticable
    implements BaseStateNormal {
  late GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  late PagingController<int, K> pagingController;

  @override
  void initState() {
    super.initState();
    pagingController = PagingController<int, K>(firstPageKey: 1);
    refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    pagingController.addPageRequestListener(onRequest);
    init();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  void onRequest(int pageKey);

  // Refreshing refresh indicator widget
  Future<void> onRefresh() async {
    pagingController.refresh();
  }

  ScaffoldAttribute buildAttribute();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: CustomScaffold(
        attr: buildAttribute(),
        body: SizingInformationBuilder(
          builder: (context, sizeInfo) {
            if (sizeInfo.deviceType == DeviceScreenType.mobile) {
              return buildNarrowLayout(
                context,
                sizeInfo,
              );
            }
            return buildWideLayout(
              context,
              sizeInfo,
            );
          },
        ),
        appBar: buildAppBar(context),
      ),
    );
  }
}
