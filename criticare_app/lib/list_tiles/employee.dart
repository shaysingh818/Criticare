import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/employee.dart'; 

class EmployeeListTile extends StatefulWidget {

  final Employee? employee;
  const EmployeeListTile({Key? key, @required this.employee}) : super(key: key);


  @override
  _EmployeeListTileState createState() => _EmployeeListTileState(employee: this.employee);
}

class _EmployeeListTileState extends State<EmployeeListTile> {

  Employee? employee; 
  _EmployeeListTileState({this.employee});


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
                        "${employee?.firstName} : ${employee?.lastName}",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Employee Id: ${employee?.employeeId} Permission: ${employee?.permissionId}",
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