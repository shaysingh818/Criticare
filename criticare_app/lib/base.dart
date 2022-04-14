import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'inserts/insert_patient.dart';
import 'inserts/insert_medication.dart';
import 'inserts/insert_employee.dart';
import 'inserts/insert_condition.dart';
import 'inserts/insert_room.dart';
import 'reads/patients.dart';
import 'reads/intake.dart';
import 'reads/employees.dart';
import 'home.dart';


class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30
  );
  List<Widget> _widgetOptions = <Widget> [
    ViewPatientsPage(), 
    ViewIntakePage(), 
    ViewEmployeesPage()
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Criticare"),
          backgroundColor: Colors.red
        ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('CRITICARE LLC'),
            ),
            ListTile(
              title: const Text('Add Patient'),
              leading: Icon(
                Icons.accessible, 
                color: Colors.red,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertPatientPage()));
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person, 
                color: Colors.red,
              ),
              title: const Text('Add Employee'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertEmployeePage()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.check_box_rounded, 
                color: Colors.red,
              ),
              title: const Text('Add Hospital Room'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertRoomPage()));
                
              },
            ),
            ListTile(
              leading: Icon(
                Icons.medication, 
                color: Colors.red,
              ),
              title: const Text('Add medication'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertMedicationPage()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.copy_sharp, 
                color: Colors.red,
              ),
              title: const Text('Add Medicial Condition'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertConditionPage()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.arrow_back_outlined, 
                color: Colors.red,
              ),
              title: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
      
          ],
        ),
      ),

      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate, 
              color: Colors.red,
            ),
            label: 'Waiting Room'
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
              color: Colors.red,
            ),
            label: 'Intake'
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.red,
            ),
            label: 'Employees'
          ),

        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),

    

    );
  }
}