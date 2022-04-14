import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/employee.dart'; 

class InsertEmployeePage extends StatefulWidget {


  @override
  _InsertEmployeePageState createState() => _InsertEmployeePageState();
}

class _InsertEmployeePageState extends State<InsertEmployeePage> {

  EmployeeApi _employeeApi = EmployeeApi(); 

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController middleNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController permissionController = new TextEditingController();


  submitEmployeeData() async {

    Map <String, dynamic> employeeApiData =  {
        'firstName': firstNameController.text,
        'middleName': middleNameController.text,
        'lastName': lastNameController.text,
        'permissionId': permissionController.text    
    }; 

    String status = await _employeeApi.createEmployee(employeeApiData);

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
                   'Add Employee',
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
                     textFieldWidget("First Name", Icons.person, firstNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Middle Name", Icons.person, middleNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Last Name", Icons.person, lastNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Permission Id", Icons.person, permissionController),
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
            title: Text("Add Employee"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitEmployeeData();
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