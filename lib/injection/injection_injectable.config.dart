// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_inject/datasources/auth_local_datasource.dart' as _i3;
import 'package:flutter_inject/datasources/auth_remote_datasource.dart' as _i8;
import 'package:flutter_inject/injection/injection_injectable.dart' as _i9;
import 'package:flutter_inject/managers/session_manager.dart' as _i7;
import 'package:flutter_inject/repositories/auth_repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

const String _test = 'test';
const String _firebase = 'firebase';
const String _node = 'node';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
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
    gh.singleton<_i4.Dio>(() => registerModule.dio);
    await gh.singletonAsync<_i5.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i6.AuthRepository>(
      () => _i6.MockAuthRepository(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i7.SessionManager>(
      () => _i7.SessionManager(gh<_i6.AuthRepository>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i6.AuthRepository>(
      () => _i6.FirebaseAuthRepository(),
      registerFor: {_firebase},
    );
    gh.factory<_i8.AuthRemoteDatasource>(
        () => _i8.AuthRemoteDatasource(gh<_i4.Dio>()));
    gh.factory<_i6.AuthRepository>(
      () => _i6.NodeAuthRepository(
        gh<_i8.AuthRemoteDatasource>(),
        gh<_i3.AuthLocalDatasource>(),
      ),
      registerFor: {_node},
    );
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
