import 'package:flutter_inject/datasources/auth_local_datasource.dart';
import 'package:flutter_inject/datasources/auth_remote_datasource.dart';
import 'package:flutter_inject/models/user.dart';

class AuthRepository {
  AuthRepository(this._remoteDatasource, this._localDatasource);

  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  User? getCurrentUser() {
    User? user = _localDatasource.getCurrentUser();
    if (user == null) {
      return _remoteDatasource.getCurrentUser();
    }
    return user;
  }
}
