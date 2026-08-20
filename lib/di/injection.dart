import 'package:app_settings/di/injection.dart';
import 'package:datastore/di/injection.dart';
import 'package:data/di/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_multi_module_arch/di/injection.config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/injection.dart';
import 'package:movies/data/di/injection.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? environment) async {
  
  Hive.initFlutter();

  await configureAppSettingsDependencies(getIt, environment);
  await configureDataStoreDependencies(getIt, environment);
  await configureCoreDataDependencies(getIt, environment);
  await configureLoginDependencies(getIt, environment);
  await configureMoviesFeatureDependencies(getIt, environment);
  getIt.init(environment: environment);
}