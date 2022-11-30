import 'package:injectable/injectable.dart';

import 'package:flutter_inject/models/user.dart';

@injectable
class AuthLocalDatasource {
  // AuthLocalDatasource(this.sharedPreferences);

  // AuthLocalDatasource() {
  //   getIt
  //       .getAsync<SharedPreferences>()
  //       .then((value) => sharedPreferences = value);
  // }

  // late SharedPreferences sharedPreferences;

  // final SharedPreferences sharedPreferences;

  User? getCurrentUser() {
    // call shared_preferences or flutter_secure_storage
    return User('Felipe Sales | Local');
  }
}
