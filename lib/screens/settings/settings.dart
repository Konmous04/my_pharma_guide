import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[500],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Text('Body'),
    );
  }
}
