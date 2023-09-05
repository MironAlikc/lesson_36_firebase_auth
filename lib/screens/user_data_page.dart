import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/screens/home_page.dart';
import 'package:lesson_36_firebase_auth/services/firebase_services.dart';
import 'package:lesson_36_firebase_auth/models/user_data_model.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controlerName = TextEditingController();
    final TextEditingController controlerSureName = TextEditingController();
    final TextEditingController controlerGender = TextEditingController();
    final TextEditingController controlerAge = TextEditingController();
    final auth = FirebaseAuth.instance;
    final service = FirebaseServices();
    auth.currentUser;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controlerName,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controlerSureName,
              decoration: InputDecoration(
                hintText: 'Sure name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controlerGender,
              decoration: InputDecoration(
                hintText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controlerAge,
              decoration: InputDecoration(
                hintText: 'age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  service.createUserData(
                    model: UserDataModel(
                      id: auth.currentUser?.uid,
                      sureName: controlerSureName.text,
                      name: controlerName.text,
                      age: controlerAge.text,
                      gender: controlerGender.text,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Registr',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
