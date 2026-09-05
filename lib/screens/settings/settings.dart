import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/my_settings.dart';
import 'package:my_pharma_guide/screens/settings/about_settings.dart';
import 'package:my_pharma_guide/screens/settings/account_settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    final List<MySettings> mySettings = [
      MySettings(
        title: 'Account',
        icon: Icons.account_circle_rounded,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));
        }
      ),
      MySettings(
        title: 'About',
        icon: Icons.help_outline,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutSettings()));
        }
      )
    ];

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'Settings',
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            final item = mySettings[index];
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: item.onTap,
              trailing: Icon(Icons.chevron_right),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return const Divider();
          },
          itemCount: mySettings.length,
        ),
      ),
    );
  }
}
