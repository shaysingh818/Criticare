import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/patient.dart';

class PatientInfo extends StatefulWidget {

    final Future<Patient>? patient;
    const PatientInfo({Key? key, @required this.patient}) : super(key: key);


  @override
  _PatientInfoState createState() => _PatientInfoState(patient: this.patient);
}

class _PatientInfoState extends State<PatientInfo> {

    Future<Patient>? patient; 
    _PatientInfoState({this.patient});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Detail"),
        backgroundColor: Colors.red
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Patient>(
          future: patient,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget> [

                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Full Name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.firstName} ${snapshot.data!.middleName} ${snapshot.data!.lastName}  "),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),

                    ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Social Security Number", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.ssn} "),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),


                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Date of Birth", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.dateOfBirth} "),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),

                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Height and Weight ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.height} : ${snapshot.data!.weight}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),


                    ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Emergency Contact ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.nextOfKin}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Home Phone", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.homePhone}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Work Phone", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.workPhone}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Health Insurance", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.healthInsurance}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                       ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Vaccination", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.vaccination}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Vaccination Date", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.vaccinationDate}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Drugs and Alcohol", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.drugsAlchohol}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Sexually Active", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.sexuallyActive}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),

                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Allergies", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.allergies}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Blood Type", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.bloodType}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),


                      ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Notes ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data!.notes}"),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                      ),

                ], 
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      ),
    );
  }
}