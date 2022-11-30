// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_inject/datasources/auth_local_datasource.dart' as _i3;
import 'package:flutter_inject/datasources/auth_remote_datasource.dart' as _i4;
import 'package:flutter_inject/managers/session_manager.dart' as _i7;
import 'package:flutter_inject/repositories/auth_repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthLocalDatasource>(() => _i3.AuthLocalDatasource());
    gh.factory<_i4.AuthRemoteDatasource>(
        () => _i4.AuthRemoteDatasource(gh<_i5.Dio>()));
    gh.factory<_i6.AuthRepository>(() => _i6.NodeAuthRepository(
          gh<_i4.AuthRemoteDatasource>(),
          gh<_i3.AuthLocalDatasource>(),
        ));
    gh.singleton<_i7.SessionManager>(
        _i7.SessionManager(gh<_i6.AuthRepository>()));
    return this;
  }
}
