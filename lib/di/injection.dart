import 'package:get_it/get_it.dart';
import 'package:flutter_multi_module_arch/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();