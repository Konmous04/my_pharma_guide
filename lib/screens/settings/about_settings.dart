import 'package:flutter/material.dart';

class AboutSettings extends StatelessWidget {
  const AboutSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          'About',
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
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.medication_rounded,
                  size: 72,
                  color: Colors.purple[400],
                ),
                const SizedBox(height: 10.0,),
                const Text(
                  'My Pharma Guide',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3.0,),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22.0,),
          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the Project',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    'My Pharma Guide was developed as an undergraduate thesis project at the Department of Informatics, '
                    'Aristotle University of Thessaloniki (AUTH).\n\nIt is designed to help users manage their medication '
                    'regimens effectively, keep track of their prescriptions, and receive timely alarms and reminders.',
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.4,
                      color: Colors.black87
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22.0,),
          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Developers',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    'Konstantinos Mousoulis\nEvangelos Panos\nGeorgios Dimitriou',
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22.0,),
          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: const ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Feedback & Support',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              subtitle: Text('email@gmail.com'),
            ),
          ),
        ],
      ),
    );
  }
}
