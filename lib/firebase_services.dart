import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> authByEmail(
      {required String email, required String password}) async {
    bool isAuthorized = false;
    try {
      final resuit = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isAuthorized = true;
      print(resuit);
    } catch (e) {
      print(e.toString());
    }
    return isAuthorized;
  }

  Future<bool> resetPassword({required String email}) async {
    bool isAuth = false;
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      isAuth = true;
    } catch (e) {
      print(e.toString());
    }
    return isAuth;
  }

  Future<bool> registartio({
    required String email,
    required String password,
  }) async {
    bool isAuth = false;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isAuth = true;
    } catch (e) {
      print(e.toString());
    }
    return isAuth;
  }
}
