import 'package:flutter/material.dart';
import 'package:flutter_inject/injection/injection.dart';
import 'package:flutter_inject/managers/session_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final sessionManager = GetIt.I.get<SessionManager>();
  final SessionManager sessionManager = getIt();

  @override
  Widget build(BuildContext context) {
    debugPrint(sessionManager.hashCode.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(sessionManager.user?.name ?? 'Not logged'),
      ),
      body: Container(),
    );
  }
}
