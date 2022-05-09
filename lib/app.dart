import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'core/bases/blocs/theme/theme_cubit.dart';
import 'core/bases/routers/go_router.dart';
import 'core/client/dio.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
BuildContext? ctx = goRouter.navigator?.context;

class App extends StatelessWidget {
  final Dio? dio;

  const App({
    Key? key,
    this.dio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject(() => (dio ?? Dio())..interceptors.add(interceptors)),
      ],
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, theme) {
            return MaterialApp.router(
              title: 'Flutter boilerplate',
              debugShowCheckedModeBanner: false,
              theme: theme,
              routerDelegate: goRouter.routerDelegate,
              routeInformationParser: goRouter.routeInformationParser,
            );
          },
        ),
      ),
    );
  }
}
