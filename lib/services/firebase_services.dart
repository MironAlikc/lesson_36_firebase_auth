import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lesson_36_firebase_auth/models/data_model.dart';
import 'package:lesson_36_firebase_auth/models/user_data_model.dart';

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

  Future<void> createData({required String image, required String data}) async {
    try {
      final doc = store.collection('data').doc();
      final model = DataModel(
        image: image,
        data: data,
        id: doc.id,
      );
      await doc.set(
        model.toJson(),
      );
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> createUserData({required UserDataModel model}) async {
    try {
      final doc = store.collection('users').doc(model.id);
      await doc.set(
        model.toJson(),
      );
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Stream<List<DataModel>> getData() {
    final resutlt = store.collection('data').snapshots().map(
          (collection) => collection.docs
              .map(
                (e) => DataModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
    return resutlt;
  }

  Stream<List<UserDataModel>> getUserData(String id) {
    final result = store.collection('users').snapshots().map(
          (colletion) => colletion.docs.map(
            (doc) {
              if (doc.id == id) {
                return UserDataModel.fromJson(
                  doc.data(),
                );
              } else {
                return UserDataModel();
              }
            },
          ).toList(),
        );
    return result;
  }

  removeFromDataBase(String id) async {
    try {
      await store.collection('data').doc(id).delete();
    } catch (e) {}
  }
}
