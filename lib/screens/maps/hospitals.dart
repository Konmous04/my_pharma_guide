import 'package:flutter/material.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
          'Nearby Hospitals',
          style: TextStyle(
              fontSize: 25.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.grey[500],
        centerTitle: true,
      ),
    );
  }
}
