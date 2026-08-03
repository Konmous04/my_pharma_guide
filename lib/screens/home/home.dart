import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pharma_guide/models/my_user.dart';
import 'package:my_pharma_guide/screens/maps/hospitals.dart';
import 'package:my_pharma_guide/screens/maps/pharmacies.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    final bool isAnon = user.isAnonymous ? true : false;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Pharmacies())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_hospital),
                title: const Text('Nearby Hospitals'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Hospitals())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
