import 'package:flutter/material.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130.0,),
            Text(
              'My Pharma Guide',
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'email'),
                    onChanged: (val) {

                    },
                  ),
                  SizedBox(height: 22.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'password'),
                    onChanged: (val) {

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign In'),
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
                  child: Text('Sign Up'),
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
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey[200],
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Text('or'),
                  SizedBox(width: 10.0,),
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
                  print(result);
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
      )
    );
  }
}
