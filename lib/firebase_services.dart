import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lesson_36_firebase_auth/data_model.dart';

class FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;

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

  Future<void> createData({required DataModel model}) async {
    try {
      final doc = store.collection('data').doc();
      await doc.set(
        model.toJson(),
      );
    } catch (e) {
      e.toString();
    }
  }

  Stream<List<DataModel>> getData() {
    final resutlt = store.collection('data').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (e) => DataModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
    return resutlt;
  }

  removeFromDataBase(String id) async {
    await store.collection('data').doc('id').delete();
  }
}
