import 'package:flutter/cupertino.dart';

class MySettings {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MySettings({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}