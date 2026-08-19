import 'package:flutter/material.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';

import '../../shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String username = '';
  String error = '';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val==null || val.isEmpty){
                              return 'Enter an email';
                            } else{
                              return null;
                            }
                          },
                          decoration: textInputDecoration.copyWith(hintText: 'email'),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        const SizedBox(height: 22.0,),
                        TextFormField(
                          validator: (val) {
                            if (val==null || val.isEmpty){
                              return 'Enter a username';
                            } else{
                              return null;
                            }
                          },
                          decoration: textInputDecoration.copyWith(hintText: 'username'),
                          onChanged: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                        ),
                        const SizedBox(height: 22.0,),
                        TextFormField(
                          validator: (val) {
                            if (val==null || val.length<6){
                              return 'Enter a password 6+ chars length';
                            } else{
                              return null;
                            }
                          },
                          decoration: textInputDecoration.copyWith(
                            hintText: 'password',
                            suffixIcon: IconButton(
                              icon: hidePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: hidePassword,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ],
                    ),
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
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signUp(email, password, username);
                          if(result == null){
                            setState(() {
                              error = 'Please supply a valid email or password';
                              loading = false;
                            });
                          }
                        }
                      },
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
                const SizedBox(height: 10.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
