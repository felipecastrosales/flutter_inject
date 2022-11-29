import 'package:flutter_inject/datasources/auth_local_datasource.dart';
import 'package:flutter_inject/datasources/auth_remote_datasource.dart';
import 'package:flutter_inject/models/user.dart';

class AuthRepository {
  final AuthRemoteDatasource remoteDatasource = AuthRemoteDatasource();
  final AuthLocalDatasource localDatasource = AuthLocalDatasource();

  User? getCurrentUser() {
    User? user = localDatasource.getCurrentUser();
    if (user == null) {
      return remoteDatasource.getCurrentUser();
    }
    return user;
  }
}
