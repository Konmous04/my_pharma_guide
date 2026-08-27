import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/my_user.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:my_pharma_guide/shared/guest_buttons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> openGoogleMaps(String search) async{
    final Uri googleMapsUrl = Uri.https(
      'www.google.com',
      '/maps/search/',
      {'api': '1', 'query': search},
    );

    if (await canLaunchUrl(googleMapsUrl)){
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else{
      print('error while opening google maps');
    }
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    final bool isAnon = user.isAnonymous;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'My Pharma Guide',
          style: TextStyle(
              fontSize: 25.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.grey[500],
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[350],
          child: ListView(
            children: [
              const SizedBox(height: 10.0,),
              Center(
                child: isAnon ? GuestButtons() : Text(
                  'Hi, ${user.username}' ?? '',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Expanded(
                child: Divider(
                  thickness: 1.5,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 10.0,),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.medical_services),
                title: const Text('Nearby Pharmacies'),
                onTap: () {
                  Navigator.pop(context);
                  openGoogleMaps('Φαρμακεία');
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_hospital),
                title: const Text('Nearby Hospitals'),
                onTap: () {
                  Navigator.pop(context);
                  openGoogleMaps('Νοσοκομεία');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.red[800],
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red[800],
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await AuthService().signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
