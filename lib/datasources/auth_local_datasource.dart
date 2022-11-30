import 'package:injectable/injectable.dart';

import 'package:flutter_inject/models/user.dart';

@injectable
class AuthLocalDatasource {
  User? getCurrentUser() {
    // call shared_preferences or flutter_secure_storage
    return User('Felipe Sales | Local');
  }
}
