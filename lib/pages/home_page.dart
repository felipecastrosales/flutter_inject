import 'package:flutter/material.dart';
import 'package:flutter_inject/managers/session_manager.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sessionManager = GetIt.I.get<SessionManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sessionManager.user?.name ?? 'Not logged'),
      ),
      body: Container(),
    );
  }
}
