import 'package:flutter/material.dart';

import 'package:flutter_inject/models/user.dart';
import 'package:flutter_inject/repositories/auth_repository.dart';

class SessionManager {
  SessionManager() {
    debugPrint('SessionManager created');
    _getCurrentUser();
  }

  final AuthRepository _authRepository = AuthRepository();

  User? user;

  void _getCurrentUser() {
    user = _authRepository.getCurrentUser();
  }
}
