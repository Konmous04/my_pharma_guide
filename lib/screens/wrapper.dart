import 'package:flutter/material.dart';
import 'package:my_pharma_guide/screens/authenticate/authenticate.dart';
import 'package:my_pharma_guide/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either Home or Authenticate widget
    return Authenticate();

  }
}
