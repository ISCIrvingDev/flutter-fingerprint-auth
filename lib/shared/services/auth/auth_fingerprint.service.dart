import 'package:local_auth/local_auth.dart';

import 'auth.repository.dart';

class AuthFingerprintService implements IAuthRepository {
  final _auth = LocalAuthentication();

  Future<bool> canAuth() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  @override
  Future<bool> auth() async {
    try {
      if (!await canAuth()) return false;

      return await _auth.authenticate(localizedReason: 'Get into the app!');
    } catch (e) {
      print(e);

      return false;
    }
  }
}
