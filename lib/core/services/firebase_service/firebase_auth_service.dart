import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseAuthenticationService {
  static final FirebaseAuthenticationService _firebaseAuthenticationService =
      FirebaseAuthenticationService._internal();

  factory FirebaseAuthenticationService() {
    return _firebaseAuthenticationService;
  }
  FirebaseAuthenticationService._internal();
  static FirebaseApp? app;
  static FirebaseAuth? auth;
  static final remoteConfig = FirebaseRemoteConfig.instance;
  static late int updateValue;

  static Future<void> initializeValue() async {
    app = await Firebase.initializeApp();
    auth = FirebaseAuth.instanceFor(app: app!);
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 2),
    ));
  }

  static Future<void> fetchRemoteConfigDetails() async {
    try {
      updateValue = await remoteConfig.getInt('app_build_version_check');
      print("remoteconfigexception $updateValue");
    } catch (e) {
      print("remoteconfigexception $e");
    }
  }
}
