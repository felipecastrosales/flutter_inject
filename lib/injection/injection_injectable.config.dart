// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_inject/datasources/auth_local_datasource.dart' as _i3;
import 'package:flutter_inject/datasources/auth_remote_datasource.dart' as _i8;
import 'package:flutter_inject/injection/injection_injectable.dart' as _i9;
import 'package:flutter_inject/managers/session_manager.dart' as _i6;
import 'package:flutter_inject/repositories/auth_repository.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

const String _node = 'node';
const String _firebase = 'firebase';
const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthLocalDatasource>(() => _i3.AuthLocalDatasource());
    gh.factory<_i4.AuthRepository>(
      () => _i4.FirebaseAuthRepository(),
      registerFor: {_firebase},
    );
    gh.factory<_i4.AuthRepository>(
      () => _i4.MockAuthRepository(),
      registerFor: {_test},
    );
    gh.singleton<_i5.Dio>(registerModule.dio);
    gh.lazySingleton<_i6.SessionManager>(
      () => _i6.SessionManager(gh<_i4.AuthRepository>()),
      dispose: (i) => i.dispose(),
    );
    await gh.singletonAsync<_i7.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i8.AuthRemoteDatasource>(
        () => _i8.AuthRemoteDatasource(gh<_i5.Dio>()));
    gh.factory<_i4.AuthRepository>(
      () => _i4.NodeAuthRepository(
        gh<_i8.AuthRemoteDatasource>(),
        gh<_i3.AuthLocalDatasource>(),
      ),
      registerFor: {_node},
    );
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
