import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/services/firebase_services.dart';
import 'package:lesson_36_firebase_auth/screens/user_data_page.dart';

class RegistrPage extends StatelessWidget {
  const RegistrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controlerEmail = TextEditingController();
    final TextEditingController controlerPassword = TextEditingController();
    final service = FirebaseServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controlerEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controlerPassword,
              decoration: InputDecoration(
                hintText: 'Passowrd',
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
                  bool isAuthorized = await service.registartio(
                    email: controlerEmail.text,
                    password: controlerPassword.text,
                  );
                  if (isAuthorized) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDataPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text('Error')),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Next',
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
