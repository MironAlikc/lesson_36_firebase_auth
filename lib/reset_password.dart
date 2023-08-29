import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';

class ResetPasswordPade extends StatelessWidget {
  const ResetPasswordPade({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: TextField(
          controller: controler,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                bool isAuth = await FirebaseServices().resetPassword(
                  email: controler.text,
                );
                if (isAuth) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(child: Text('Error')),
                    ),
                  );
                }
              },
            ),
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
