import 'package:flutter/material.dart';
import 'package:flutter_inject/managers/session_manager.dart';
import 'package:flutter_inject/models/user.dart';
import 'package:get_it/get_it.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sessionManager = GetIt.I.get<SessionManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint(sessionManager.hashCode.toString());
            sessionManager.user = User('Felipe Sales');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
