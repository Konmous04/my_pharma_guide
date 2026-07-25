import 'package:flutter/material.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Register Form',
                  style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'email'),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(height: 22.0,),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'password'),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        widget.toggleView();
                      },
                      child: const Text('Sign In'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
