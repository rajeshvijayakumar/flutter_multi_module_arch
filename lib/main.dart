import 'package:app_settings/provider/AppSettingsProvider.dart';
import 'package:datastore/provider/session/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:navigator/navigation_module.dart';
import 'di/injection.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);
  runApp(NavigationModule());
}
