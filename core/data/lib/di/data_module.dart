
import 'package:data/di/data_module_keys.dart';
import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences/Preferences_provider.dart';
import 'package:datastore/provider/preferences/preferences_provider_impl.dart';
import 'package:datastore/provider/session/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {

  //provide base url
  @Named(DataModuleKeys.baseUrl)
  String providerBaseUrl(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getBaseUrl();

  @Named(DataModuleKeys.accessToken)
  String provideAccessToken(SessionProvider sessionProvider) =>
      sessionProvider.getAccessToken();

  @Named(DataModuleKeys.language)
  String provideAppLanguage(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getAppLanguage();

  @lazySingleton
  Dio dio(
  @Named(DataModuleKeys.baseUrl) String baseUrl,
  @Named(DataModuleKeys.accessToken) String accessToken,
  @Named(DataModuleKeys.language) String language
  ) {
    final dioFactory = DioFactory(
        baseUrl: baseUrl, accessToken: accessToken, language: language);

    return dioFactory.getDio();
  }
}