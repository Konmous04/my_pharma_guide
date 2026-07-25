import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pharma_guide/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _auth.signOut();
          },
          child: Text('log out'),
        ),
      ),
    );
  }
}
