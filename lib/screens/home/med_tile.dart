import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/medicines.dart';

class MedTile extends StatelessWidget {

  final Medicines med;
  const MedTile({super.key, required this.med});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              med.imageURL,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            '${med.name} | ${med.dosage}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('${med.activeSubstance} \n${med.description}'),
        ),
      ),
    );
  }
}
