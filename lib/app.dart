import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter boilerplate',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: Scaffold(
        body: Container(),
      ),
      routes: {
        '/callback': (context) => Scaffold(
              body: Container(),
            ),
      },
    );
  }
}
