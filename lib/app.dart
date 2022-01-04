import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strong_boilerplate/core/bases/blocs/theme/theme_cubit.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_bloc.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/pages/main_page.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<GithubSearchBloc>(create: (_) => GithubSearchBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            title: 'Flutter boilerplate',
            debugShowCheckedModeBanner: false,
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ],
            theme: theme,
            home: const MainPage(),
            routes: {
              '/callback': (context) => Scaffold(
                    body: Container(),
                  ),
            },
          );
        },
      ),
    );
  }
}
