import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';
import 'package:lesson_36_firebase_auth/home_page.dart';
import 'package:lesson_36_firebase_auth/registr_page.dart';
import 'package:lesson_36_firebase_auth/reset_password.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controlerEmail = TextEditingController();
    final TextEditingController controlerPassword = TextEditingController();
    final service = FirebaseServices();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
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
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  bool isAuthorized = await service.authByEmail(
                      email: controlerEmail.text,
                      password: controlerPassword.text);
                  if (isAuthorized) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
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
                  'Auth',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordPade(),
                  ),
                );
              },
              child: const Text('Forgot password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrPage(),
                  ),
                );
              },
              child: const Text('Rgistration'),
            ),
          ],
        ),
      ),
    );
  }
}
