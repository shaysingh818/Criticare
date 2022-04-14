import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/medical_condition.dart'; 

class InsertConditionPage extends StatefulWidget {


  @override
  _InsertConditionPageState createState() => _InsertConditionPageState();
}

class _InsertConditionPageState extends State<InsertConditionPage> {


  MedicalConditionApi _conditionApi = MedicalConditionApi(); 

  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();


  submitConditionData() async {

    Map <String, dynamic> conditionApiData =  {
        'name': nameController.text,
        'code': codeController.text    
    }; 

    String status = await _conditionApi.createMedicalCondition(conditionApiData);

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
                   'Add Medical Condition',
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
                     textFieldWidget("Name: ", Icons.person, nameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Code", Icons.person, codeController),
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
            title: Text("Add Medical Condition"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitConditionData();
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