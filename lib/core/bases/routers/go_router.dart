import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app.dart';
import '../../../features/example_github_search/presentation/pages/main_page.dart';
import 'go_router_paths.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: GoRouterPaths.home,
      builder: (context, state) => const MainPage(),
    ),
  ],
  debugLogDiagnostics: kDebugMode,
  observers: [
    FirebaseAnalyticsObserver(analytics: analytics),
  ],
  errorBuilder: (context, state) => const Text('Error'),
  redirect: (state) {
    return null;
  },
);
