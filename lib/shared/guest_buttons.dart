import 'package:flutter/material.dart';
import 'package:my_pharma_guide/services/auth.dart';

class GuestButtons extends StatelessWidget {
  const GuestButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: const Text(
            'To get full access in our application you have to: ',
            textAlign: TextAlign.center,
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async{
                Navigator.pop(context);
                await AuthService().signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text('    Sign In  /  Register    '),
            ),
          ],
        ),
      ],
    );
  }
}
