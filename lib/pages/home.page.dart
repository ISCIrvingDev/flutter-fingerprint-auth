import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_auth/pages/authtenticated.page.dart';
import 'package:flutter_fingerprint_auth/shared/services/auth/auth_fingerprint.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var authFingerprintService = AuthFingerprintService();

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
                  bool auth = await authFingerprintService.auth();

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
