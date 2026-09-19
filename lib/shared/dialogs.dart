import 'package:flutter/material.dart';
import 'package:my_pharma_guide/shared/constants.dart';

Future<bool?> dialogBuilderChangeUsername(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Change Username'),
        content: Text('Are you sure you want to proceed in this action?'),
        backgroundColor: Colors.grey[200],
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
            ),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
            ),
            child: Text('Continue'),
          ),
        ],
      );
    }
  );
}

Future<String?> dialogBuilderDeletingAccount(BuildContext context) {
  String password = '';
  final dialogFormKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete Account'),
        content: Form(
          key: dialogFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Please write your password below, if you want to delete your account.'),
              const SizedBox(height: 15.0,),
              TextFormField(
                validator: (val){
                  if (val==null || val.length<6){
                    return 'Enter a password 6+ chars length';
                  } else{
                    return null;
                  }
                },
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                onChanged: (val){
                  password = val;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if(dialogFormKey.currentState?.validate()==true){
                Navigator.pop(context, password);
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
            ),
            child: Text('Continue'),
          ),
        ],
      );
    }
  );
}