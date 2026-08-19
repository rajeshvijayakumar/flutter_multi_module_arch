// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/di/data_module.dart' as _i202;
import 'package:data/network/network_info.dart' as _i462;
import 'package:datastore/provider/preferences/Preferences_provider.dart'
    as _i931;
import 'package:datastore/provider/session/session_provider.dart' as _i1014;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dataModule = _$DataModule();
    gh.lazySingleton<_i462.NetworkInfo>(() => dataModule.provideNetworkInfo());
    gh.factory<String>(
      () => dataModule.provideAppLanguage(gh<_i931.PreferencesProvider>()),
      instanceName: 'Language',
    );
    gh.factory<String>(
      () => dataModule.providerBaseUrl(gh<_i931.PreferencesProvider>()),
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => dataModule.provideAccessToken(gh<_i1014.SessionProvider>()),
      instanceName: 'AccessToken',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dataModule.dio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<String>(instanceName: 'AccessToken'),
        gh<String>(instanceName: 'Language'),
      ),
    );
    return this;
  }
}

class _$DataModule extends _i202.DataModule {}
