import 'package:flutter_inject/injection/injection_injectable.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_inject/datasources/auth_local_datasource.dart';
import 'package:flutter_inject/datasources/auth_remote_datasource.dart';
import 'package:flutter_inject/models/user.dart';

abstract class AuthRepository {
  User? getCurrentUser();
}

@Injectable(as: AuthRepository, env: ['node'])
class NodeAuthRepository implements AuthRepository {
  NodeAuthRepository(this._remoteDatasource, this._localDatasource);

  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  @override
  User? getCurrentUser() {
    User? user = _localDatasource.getCurrentUser();
    if (user == null) {
      return _remoteDatasource.getCurrentUser();
    }
    return user;
  }
}

@Injectable(as: AuthRepository, env: ['firebase'])
class FirebaseAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return User('Felipe Sales | Firebase');
  }
}

@firebase
@Injectable(as: AuthRepository, env: ['test'])
class MockAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return User('Felipe Sales | Mock');
  }
}
