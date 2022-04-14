import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/intake.dart'; 

class InsertIntakePage extends StatefulWidget {

  final int? patientId;
  const InsertIntakePage({Key? key, @required this.patientId}) : super(key: key);


  @override
  _InsertIntakePageState createState() => _InsertIntakePageState(patientId: this.patientId);
}

class _InsertIntakePageState extends State<InsertIntakePage> {

  int? patientId; 
  _InsertIntakePageState({this.patientId});

  IntakeApi _intakeApi = IntakeApi(); 

  TextEditingController bloodPressureController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();


  submitIntakeData() async {

    Map <String, dynamic> intakeApiData =  {
        'bloodPressure': bloodPressureController.text,
        'notes': notesController.text    
    }; 

    String status = await _intakeApi.createIntake(intakeApiData, patientId);

  }

  Container submitButton(){
      return Container(
          height: 55, 
          width: 200, 
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15.0)
           ),
           child: Center(
               child: Text(
                   'Intake Patient',
                   style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16 
                   ),
               ),
           ),
      );
  }

  Container textSection(){
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.only(top: 30.0),
          child: Center(
              child: Column(
                  children: <Widget> [
                     SizedBox(height: 20.0),
                     textFieldWidget("Blood Pressure: ", Icons.person, bloodPressureController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Notes", Icons.person, notesController),
                  ]
              ),
          ),
      );
  }

   TextFormField textFieldWidget(String title, IconData icon, TextEditingController txtController){
      return TextFormField(
          controller: txtController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true, 
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              hintText: title, 
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(icon, color: Colors.red)
          ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Intake Patient"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitIntakeData();
                    },
                    child: submitButton(), 
                  ),
                  SizedBox(height: 20.0),
              ]
          ),
      ),
    );
  }
}