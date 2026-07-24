import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/my_user.dart';
import 'package:my_pharma_guide/screens/authenticate/authenticate.dart';
import 'package:my_pharma_guide/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);

    //return either Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else{
      return Home();
    }

  }
}
