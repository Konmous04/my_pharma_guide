import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/medicines.dart';

void showMedDescription(BuildContext context, Medicines med){
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Μικρή γκρι μπάρα
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),

            // Εικόνα και βασικά στοιχεία
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Κουτί προβολής της εικόνας
                Container(
                  width: 90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 3,
                    )
                  ),
                  child: Image.network(
                    med.imageURL,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                      const Icon(
                        Icons.medication,
                        size: 40.0,
                        color: Colors.grey,
                      ),
                  ),
                ),
                const SizedBox(width: 16.0),

                // name, activeSubstance and dosage
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            med.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(
                              Icons.bookmark_outline_rounded,
                              size: 25.0,
                              color: Colors.grey[450],
                            ),
                          )
                        ],
                      ),

                      // active substance
                      Text(
                        med.activeSubstance,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700
                        ),
                      ),
                      const SizedBox(height: 8.0,),

                      // dosage
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(14.0),
                          border: Border.all(color: Colors.blue.shade100),
                        ),
                        child: Text(
                          med.dosage,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),

            // description
            const Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 20.0,
                  color: Colors.black87,
                ),
                SizedBox(width: 8.0,),
                Text(
                  'Περιγραφή & Ένδειξη',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                med.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ]
        ),
      );
    }
  );
}

