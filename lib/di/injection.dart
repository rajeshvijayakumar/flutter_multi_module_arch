import 'package:app_settings/di/injection.dart';
import 'package:datastore/di/injection.dart';
import 'package:data/di/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_multi_module_arch/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? environment) async {
  getIt.init(environment: environment);
  await configureAppSettingsDependencies(getIt, environment);
  await configureDataStoreDependencies(getIt, environment);
  await configureCoreDataDependencies(getIt, environment);
}