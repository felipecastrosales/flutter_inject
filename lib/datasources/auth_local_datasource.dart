import 'package:flutter_inject/models/user.dart';

class AuthLocalDatasource {
  User? getCurrentUser() {
    // call shared_preferences or flutter_secure_storage
    return User('Felipe Sales | Local');
  }
}
