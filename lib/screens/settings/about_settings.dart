import 'package:flutter/material.dart';

class AboutSettings extends StatelessWidget {
  const AboutSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'About',
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
      body: Text('data'),
    );
  }
}
