import 'package:flutter/material.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/constants.dart';
import 'package:my_pharma_guide/shared/loading.dart';
import 'package:my_pharma_guide/shared/dialogs.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String username = '';
  bool loading = false;
  String wrongPassword = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'Account Settings',
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[500],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Choose a new username for your account. This name will be displayed across your app profile and settings.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 20.0,),
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
                const SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState?.validate() == true){
                      bool? confirm = await dialogBuilderChangeUsername(context);
                      if (confirm == true){
                        setState(() {
                          loading = true;
                        });
                        await _auth.updateUsername(username);
                        if (context.mounted){
                          Navigator.pop(context);
                        }
                      } else{
                        setState(() {
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
                  child: const Text('Save Changes'),
                ),
                const SizedBox(height: 15.0,),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 15.0,),
                const Text('If you want to delete your account, press the button bellow.'),
                const SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () async{
                    String? password = await dialogBuilderDeletingAccount(context);
                    if (password != null){
                      setState(() {
                        loading = true;
                      });
                      dynamic reAuth = await _auth.reAuthenticate(password);
                      if (reAuth){
                        bool result = await AuthService().deleteAccount();
                        if(context.mounted && result){
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        } else if(mounted){
                          setState(() {
                            loading = false;
                          });
                        }
                      } else{
                        setState(() {
                          loading = false;
                          wrongPassword = 'Wrong password! Try again';
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
                  child: const Text('Delete Account'),
                ),
                const SizedBox(height: 15.0,),
                Text(
                  wrongPassword,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
