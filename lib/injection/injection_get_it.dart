import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inject/managers/session_manager.dart';

import 'package:get_it/get_it.dart';

import 'package:flutter_inject/datasources/auth_local_datasource.dart';
import 'package:flutter_inject/datasources/auth_remote_datasource.dart';
import 'package:flutter_inject/repositories/auth_repository.dart';

final getIt = GetIt.I;

void configureDependencies() {
  debugPrint('Configuring dependencies');

  // final sessionManager = SessionManager();
  // debugPrint(sessionManager.hashCode.toString());
  // GetIt.I.registerSingleton<SessionManager>(sessionManager);
  // GetIt.I.registerSingleton<SessionManager>(SessionManager());
  // GetIt.I.registerLazySingleton<SessionManager>(() => SessionManager());
  // getIt.registerFactory(() => SessionManager());
  // getIt.registerSingleton(
  //   SessionManager(
  //     AuthRepository(AuthRemoteDatasource(Dio()), AuthLocalDatasource()),
  //   ),
  // );
  // getIt.registerSingleton(LoginManager(
  //   AuthRepository(AuthRemoteDatasource(Dio()), AuthLocalDatasource()),
  // ));

  // Add dependencies in order!

  // var useFirebase = false;

  getIt.registerSingleton(Dio());
  getIt.registerFactory((() => AuthRemoteDatasource(getIt())));
  getIt.registerFactory((() => AuthLocalDatasource()));
  getIt.registerFactory<AuthRepository>(
    () => NodeAuthRepository(getIt(), getIt()),
  ); // getIt<AuthRemoteDatasource>(), getIt<AuthLocalDatasource>(),

  // if (useFirebase) {
  //   getIt.registerFactory<AuthRepository>(
  //     () => FirebaseAuthRepository(),
  //   );
  // } else {
  //   getIt.registerFactory<AuthRepository>(
  //     () => NodeAuthRepository(getIt(), getIt()),
  //   );
  // }

  getIt.registerSingleton(SessionManager(getIt()));
  getIt.registerSingleton(LoginManager(getIt()));

  debugPrint('Dependencies configured');
}

class LoginManager {
  LoginManager(this.authRepository);
  final AuthRepository authRepository;
}
