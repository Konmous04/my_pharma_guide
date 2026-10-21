import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pharma_guide/models/medicines.dart';

class DatabaseService {
  // collection reference
  final CollectionReference medCollection = FirebaseFirestore.instance.collection('medicines');

  // medicines list from snapshot
  List<Medicines> _medListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Medicines(
        name: doc.get('name') ?? '',
        dosage: doc.get('dosage') ?? '',
        activeSubstance: doc.get('activeSubstance') ?? '',
        description: doc.get('description') ?? '',
        imageURL: doc.get('imageURL') ?? ''
      );
    }).toList();
  }

  // get medicines stream
  Stream<List<Medicines>> get medicines {
    return medCollection.snapshots()
      .map(_medListFromSnapshot);
  }
}