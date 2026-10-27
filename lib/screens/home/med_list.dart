import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/medicines.dart';
import 'package:my_pharma_guide/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:my_pharma_guide/screens/home/med_tile.dart';

class MedList extends StatefulWidget {
  const MedList({super.key});

  @override
  State<MedList> createState() => _MedListState();
}

class _MedListState extends State<MedList> {
  @override
  Widget build(BuildContext context) {

    final meds = Provider.of<List<Medicines>?>(context);

    if(meds==null || meds.isEmpty){
      return const Loading();
    }

    final shuffleMeds = List<Medicines>.from(meds)..shuffle();

    return ListView.builder(
      itemCount: shuffleMeds.length,
      itemBuilder: (context, index) {
        return MedTile(med: shuffleMeds[index]);
      },
    );
  }
}
