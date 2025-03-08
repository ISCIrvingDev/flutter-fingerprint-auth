import 'package:flutter/material.dart';

class AuthenticatedPage extends StatefulWidget {
  const AuthenticatedPage({super.key});

  @override
  State<AuthenticatedPage> createState() => _AuthenticatedPageState();
}

class _AuthenticatedPageState extends State<AuthenticatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192359),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 21, 54),
        centerTitle: true,
        title: Text(
          'Authenticated Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Authenticated Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
