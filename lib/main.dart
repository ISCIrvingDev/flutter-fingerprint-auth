import 'package:flutter/material.dart';

import 'pages/authtenticated.page.dart';
import 'shared/services/auth.service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192359),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 21, 54),
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Use your fingerprint to log into the app',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 28),
              Divider(color: Colors.white60),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                icon: Icon(Icons.fingerprint),
                onPressed: () async {
                  bool auth = await AuthService.auth();

                  if (auth) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => AuthenticatedPage(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder:
                          (builder) => AlertDialog(
                            title: Text('It wasn\'t able to auth'),
                            content: Text('The device has no Fingerprint'),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Close'),
                              ),
                            ],
                          ),
                    );
                  }
                },
                label: Text('Authtenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
