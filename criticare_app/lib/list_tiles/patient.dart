import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/patient.dart'; 
import '../models/patient.dart'; 
import '../inserts/insert_intake.dart'; 

class PatientListTile extends StatefulWidget {

  final Patient? patient;
  const PatientListTile({Key? key, @required this.patient}) : super(key: key);


  @override
  _PatientListTileState createState() => _PatientListTileState(patient: this.patient);
}

class _PatientListTileState extends State<PatientListTile> {

  Patient? patient; 
  _PatientListTileState({this.patient});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget> [
                 ListTile(
                    leading: Icon(
                        Icons.face_rounded,
                        color: Colors.red 
                    ), 
                    title: Text(
                        "${patient?.firstName} : ${patient?.lastName}",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Date Created: ${patient?.dateOfBirth} SSN: ${patient?.ssn}",
                    ),
                    trailing: Wrap(
                        spacing: 15,
                        children: <Widget>[
                            IconButton(
                                icon: Icon(
                                    Icons.check, 
                                    color: Colors.green, 
                                ),
                                onPressed: (){
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => InsertIntakePage(patientId: patient?.patientId)));
                                }
                            ),


                            IconButton(
                                icon: Icon(
                                    Icons.do_not_disturb_on_outlined, 
                                    color: Colors.red, 
                                ),
                                onPressed: (){
                                    PatientApi.deletePatient(patient?.patientId);
                                }
                            ),
                            Icon(
                                Icons.more_vert, 
                                color: Colors.blue, 
                            ),
                        ]
                    )
                )
            ],
        ),
    );
  }
}