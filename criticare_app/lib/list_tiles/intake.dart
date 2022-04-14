import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/intake.dart'; 
import '../detail_views/intake_patient.dart'; 


class IntakeListTile extends StatefulWidget {

  final Intake? intake;
  const IntakeListTile({Key? key, @required this.intake}) : super(key: key);


  @override
  _IntakeListTileState createState() => _IntakeListTileState(intake: this.intake);
}


class _IntakeListTileState extends State<IntakeListTile> {

  Intake? intake; 
  _IntakeListTileState({this.intake});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget> [
                 ListTile(
                     onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IntakeDetailPage(intake: intake)));
                     },
                    leading: Icon(
                        Icons.face_rounded,
                        color: Colors.red 
                    ), 
                    title: Text(
                        " ${intake?.intakeId} : ${intake?.bloodPressure} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Patient Intake Id: ${intake?.intakeId} ",
                    ),
                    trailing: Wrap(
                        spacing: 15,
                        children: <Widget>[
                            Icon(
                                Icons.add, 
                                color: Colors.green, 
                            ),
                            Icon(
                                Icons.do_not_disturb_on_outlined,
                                color: Colors.red, 
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