import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_inject/injection/injection_injectable.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

const node = Environment('node');
const firebase = Environment('firebase');
const test = Environment('test');

@InjectableInit()
Future<void> configureDependencies() => getIt.init(
      environment: 'node',
      // environment: 'firebase',
      // environment: 'test',
    );

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();

  // @preResolve is for async dependencies, and init on app start
  // but this await the init and put more time to start the app (in some cases)
  // if not use @preResolve, we can use putAsync and init on constructor
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
