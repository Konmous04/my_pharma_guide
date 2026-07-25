import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
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
                      print(email);
                      print(password);
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
                  dynamic result = await _auth.signInAnon();
                  if (result == null){
                    print('error');
                  } else{
                    print('signed in');
                    print(result.uid);
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
