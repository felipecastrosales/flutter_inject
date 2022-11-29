import 'package:dio/dio.dart';
import 'package:flutter_inject/models/user.dart';

class AuthRemoteDatasource {
  final Dio dio = Dio();

  User? getCurrentUser() {
    // call dio
    return User('Felipe Sales | Remote');
  }
}
