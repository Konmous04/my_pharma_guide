import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';
import 'package:my_pharma_guide/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'My Pharma Guide',
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
                          if (val == null || val.isEmpty){
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
                            color: Colors.grey[500],
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
                      if (_formKey.currentState?.validate() == true){
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(() {
                            error = 'Please check your email or password';
                            loading = false;
                          });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Sign In'),
                  ),
                  SizedBox(width: 20.0,),
                  ElevatedButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Sign Up'),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    const Text('or'),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async{
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.signInAnon();
                  if (result == null){
                    setState(() {
                      loading = false;
                    });
                  }
                },
                child: Text(
                  'Continue Anonymously',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[800],
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
