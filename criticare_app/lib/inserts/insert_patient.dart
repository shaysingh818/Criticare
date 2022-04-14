import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/patient.dart'; 

class InsertPatientPage extends StatefulWidget {


  @override
  _InsertPatientPageState createState() => _InsertPatientPageState();
}

class _InsertPatientPageState extends State<InsertPatientPage> {

  PatientApi _patientApi = PatientApi(); 

  TextEditingController ssnController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController middleNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController nextKinController = new TextEditingController();
  TextEditingController homePhoneController = new TextEditingController();
  TextEditingController workPhoneController = new TextEditingController();
  TextEditingController symptomsController = new TextEditingController();
  TextEditingController healthInsuranceController = new TextEditingController();
  TextEditingController vaccinationController = new TextEditingController();
  TextEditingController vaccineDateController = new TextEditingController();
  TextEditingController drugsAlcoholController = new TextEditingController();
  TextEditingController sexuallyActiveController = new TextEditingController();
  TextEditingController allergiesController = new TextEditingController();
  TextEditingController bloodTypeController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();

  submitPatientData() async {

    Map <String, dynamic> patientApiData =  {
        'ssn': ssnController.text,
        'firstName': firstNameController.text,
        'middleName': middleNameController.text,
        'lastName': lastNameController.text,
        'dob': dobController.text,
        'height': heightController.text,
        'weight': weightController.text,
        'nextOfKin': nextKinController.text,
        'homePhone': homePhoneController.text,
        'workPhone': workPhoneController.text,
        'symptoms': symptomsController.text,
        'healthInsurance': healthInsuranceController.text,
        'vaccination': vaccinationController.text,
        'vaccinationDate': vaccineDateController.text,
        'drugsAlcohol': drugsAlcoholController.text,
        'sexuallyActive': sexuallyActiveController.text,
        'allergies': allergiesController.text,
        'bloodType': bloodTypeController.text,
        'notes': notesController.text
    }; 

    String status = await _patientApi.createPatient(patientApiData);

  }

  Container logInButton(){
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
                   'Add Patient',
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
                     textFieldWidget("SSN: ", Icons.person, ssnController),
                     SizedBox(height: 20.0),
                     textFieldWidget("First Name", Icons.person, firstNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Middle Name", Icons.person, middleNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Last Name", Icons.person, lastNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Date of Birth", Icons.person, dobController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Patient Height", Icons.person, heightController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Patient Weight", Icons.person, weightController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Next Of Kin", Icons.person, nextKinController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Home Phone", Icons.phone, homePhoneController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Work Phone", Icons.phone, workPhoneController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Symptoms", Icons.person, symptomsController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Health Insurance ID", Icons.person, healthInsuranceController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Vaccination Status", Icons.more, vaccinationController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Vaccination Date", Icons.person, vaccineDateController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Drugs and Alcohol", Icons.person, drugsAlcoholController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Sexually Active", Icons.person, sexuallyActiveController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Allergies", Icons.person, allergiesController), 
                     SizedBox(height: 20.0),
                     textFieldWidget("Blood Type", Icons.person, bloodTypeController),
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
                        submitPatientData();
                    },
                    child: logInButton(), 
                  ),
                  SizedBox(height: 20.0),
              ]
          ),
      ),
    );
  }
}