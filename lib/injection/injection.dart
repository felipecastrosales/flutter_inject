import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:flutter_inject/managers/session_manager.dart';

final getIt = GetIt.I;

void configureDependencies() {
  debugPrint('Configuring dependencies');
  // final sessionManager = SessionManager();
  // debugPrint(sessionManager.hashCode.toString());
  // GetIt.I.registerSingleton<SessionManager>(sessionManager);
  // GetIt.I.registerSingleton<SessionManager>(SessionManager());
  // GetIt.I.registerLazySingleton<SessionManager>(() => SessionManager());
  getIt.registerFactory(() => SessionManager());
  debugPrint('Dependencies configured');
}
