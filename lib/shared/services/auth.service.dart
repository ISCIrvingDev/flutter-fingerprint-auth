import 'package:local_auth/local_auth.dart';

class AuthService {
  static final _auth = LocalAuthentication();

  static Future<bool> canAuth() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> auth() async {
    try {
      if (!await canAuth()) return false;

      return await _auth.authenticate(localizedReason: 'Get into the app!');
    } catch (e) {
      print(e);

      return false;
    }
  }
}
