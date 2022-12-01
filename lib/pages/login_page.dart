import 'package:flutter/material.dart';
import 'package:flutter_inject/injection/injection_injectable.dart';
import 'package:flutter_inject/managers/session_manager.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 1.
                // final sessionManager = GetIt.I.get<SessionManager>();
                // 2.
                // final SessionManager sessionManager = GetIt.I.get();
                // 3.
                // final SessionManager sessionManager = getIt();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint(
                  'before isRegistered: ${getIt.isRegistered<SessionManager>()}',
                );
                // getIt.unregister<SessionManager>();
                getIt.resetLazySingleton<SessionManager>();
                debugPrint(
                  'after isRegistered: ${getIt.isRegistered<SessionManager>()}',
                );
                // getIt.registerSingleton<SessionManager>(getIt());
              },
              child: const Text('Remove SessionManager'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint(
                  // 'before reset all: ${getIt.reset()}',
                  'before reset all: ',
                );
                // getIt.reset();
                debugPrint(
                  // 'after reset all: ${getIt.reset()}',
                  'after reset all: ',
                );
                // open
                // getIt.registerSingleton<SessionManager>(getIt());
              },
              child: const Text('Reset all'),
            ),
          ],
        ),
      ),
    );
  }
}
