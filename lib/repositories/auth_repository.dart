import 'package:flutter_inject/datasources/auth_local_datasource.dart';
import 'package:flutter_inject/datasources/auth_remote_datasource.dart';
import 'package:flutter_inject/models/user.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  User? getCurrentUser();
}

@Injectable(as: AuthRepository)
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

class FirebaseAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return User('Felipe Sales | Firebase');
  }
}
