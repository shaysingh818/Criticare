import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/medication.dart';
import '../api/medication.dart';
import '../models/intake.dart';



class MedicationTile extends StatefulWidget {

  final Intake? intake;
  final Medication? medication;
  const MedicationTile({Key? key, @required this.medication, @required this.intake}) : super(key: key);


  @override
  _MedicationTileState createState() => _MedicationTileState(medication: this.medication, intake: this.intake);
}

class _MedicationTileState extends State<MedicationTile> {

  Medication? medication; 
  Intake? intake; 
  _MedicationTileState({this.medication, this.intake});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
              MedicationApi.prescribeMedication(intake?.intakeId, medication?.medicationId); 
              print("Prescribe medication "); 
          }, 
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.center, 
              padding: const EdgeInsets.all(8),
              child: Column(
                  children: <Widget> [
                      SizedBox(height: 30), 
                      Icon(
                          Icons.medication,
                          color: Colors.red, 
                          size: 100,
                      ), 
                      SizedBox(height: 10.0), 
                      Text('${medication?.name}', style: TextStyle(color: Colors.red, fontSize: 30)),
                      SizedBox(height: 15.0), 
                      Text('\$ ${medication?.price}', style: TextStyle(color: Colors.green, fontSize: 20)),
                  ],
              ),
              color: Colors.grey[200],
          ),
        )
      )

    );
  }
}