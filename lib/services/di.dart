import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt get = GetIt.I;

@injectableInit
Future<GetIt> configureDependencies({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    $initGetIt(
      get,
      environment: environment,
      environmentFilter: environmentFilter,
    );
