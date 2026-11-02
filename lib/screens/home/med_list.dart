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

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  String _removeAccents(String str) {
    const withAccents = 'άέήίόύώϊϋΐΰΆΈΉΊΌΎΏ';
    const withoutAccents = 'αεηιουωιυιυΑΕΗΙΟΥΩ';

    String result = str;
    for (int i=0; i<withoutAccents.length; i++){
      result = result.replaceAll(withAccents[i], withoutAccents[i]);
    }
    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final meds = Provider.of<List<Medicines>?>(context);

    if(meds==null){
      return const Loading();
    }

    if(meds.isEmpty){
      return const Center(
        child: Text('Δεν υπάρχουν διαθέσιμα φάρμακα.'),
      );
    }

    final cleanQuery = _removeAccents(_searchQuery.trim().toLowerCase());
    final filteredMeds = meds.where((med) {
      final cleanName = _removeAccents(med.name.toLowerCase());
      final cleanSubstance = _removeAccents(med.activeSubstance.toLowerCase());
      final matchesName = cleanName.contains(cleanQuery);
      final matchesSubstance = cleanSubstance.contains(cleanQuery);
      return matchesName || matchesSubstance;
    }).toList();

    return Column(
      children: [
        const SizedBox(height: 16.0,),

        //αναζήτηση
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: SearchBar(
            controller: _searchController,
            hintText: 'Αναζήτηση φαρμάκου ή ουσίας...',
            leading: const Icon(Icons.search),
            trailing: [
              if (_searchQuery.isNotEmpty)
                IconButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
            ],
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),

        //λίστα φαρμάκων
        Expanded(
          child: filteredMeds.isEmpty
              ? const Center(
                  child: Text('Δεν βρέθηκαν αποτελέσματα.'),
                )
              : ListView.builder(
                  itemCount: filteredMeds.length,
                  itemBuilder: (context, index) {
                    return MedTile(med: filteredMeds[index]);
                  },
                ),
        ),
      ],
    );
  }
}
