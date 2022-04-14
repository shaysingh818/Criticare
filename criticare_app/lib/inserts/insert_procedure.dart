import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/procedure.dart'; 
import '../models/room.dart';
import '../models/intake.dart';

class InsertProcedurePage extends StatefulWidget {


  final Room? room;
  final Intake? intake;
  const InsertProcedurePage({Key? key, @required this.room, @required this.intake}) : super(key: key);


  @override
  _InsertProcedurePageState createState() => _InsertProcedurePageState(room: this.room, intake: this.intake);
}

class _InsertProcedurePageState extends State<InsertProcedurePage> {


   Room? room; 
   Intake? intake; 
  _InsertProcedurePageState({this.room, this.intake});


  ProcedureApi _procedureApi = ProcedureApi(); 

  TextEditingController costController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();


  submitProcedureData() async {

    Map <String, dynamic> procedureApiData =  {
        'room_id': room?.roomId, 
        'cost': costController.text,
        'name': nameController.text,
        'notes': notesController.text    
    }; 

    // create procedure
    int procId = await _procedureApi.createProcedure(procedureApiData);
    print("Procedure id " +  procId.toString()); 
    print(intake?.intakeId); 

    // assign procedure to patient
    ProcedureApi.assignProcedure(procId, intake?.intakeId); 
    


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
                   'Add Procedure',
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
                     textFieldWidget("Cost: ", Icons.person, costController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Name: ", Icons.person, nameController),
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
            title: Text("Create procedure for patient"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitProcedureData();
                        Navigator.pop(context);
                        Navigator.pop(context);
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