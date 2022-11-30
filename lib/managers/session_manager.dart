import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import 'package:flutter_inject/models/user.dart';
import 'package:flutter_inject/repositories/auth_repository.dart';

@singleton
class SessionManager {
  SessionManager(this._authRepository) {
    debugPrint('SessionManager created');
    _getCurrentUser();
  }

  final AuthRepository _authRepository;

  User? user;

  void _getCurrentUser() {
    user = _authRepository.getCurrentUser();
  }
}
