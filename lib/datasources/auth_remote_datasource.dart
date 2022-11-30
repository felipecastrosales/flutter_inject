import 'package:dio/dio.dart';
import 'package:flutter_inject/models/user.dart';

class AuthRemoteDatasource {
  AuthRemoteDatasource(this.dio);
  final Dio dio;

  User? getCurrentUser() {
    // call dio
    return User('Felipe Sales | Remote');
  }
}
