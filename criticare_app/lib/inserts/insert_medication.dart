import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/medication.dart'; 

class InsertMedicationPage extends StatefulWidget {


  @override
  _InsertMedicationPageState createState() => _InsertMedicationPageState();
}

class _InsertMedicationPageState extends State<InsertMedicationPage> {

  MedicationApi _medicationApi = MedicationApi(); 

  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();


  submitMedicationData() async {

    Map <String, dynamic> medicationApiData =  {
        'name': nameController.text,
        'code': codeController.text,
        'price': priceController.text    }; 

    String status = await _medicationApi.createMedication(medicationApiData);

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
                   'Add Medication',
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
                     SizedBox(height: 20.0),
                     textFieldWidget("Price", Icons.person, priceController),
                     SizedBox(height: 20.0),
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
              prefixIcon: Icon(icon)
          ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Add patient"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitMedicationData();
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