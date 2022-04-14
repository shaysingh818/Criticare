import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/employee.dart'; 
import '../api/employee.dart';
import '../list_tiles/employee.dart';

class ViewEmployeesPage extends StatefulWidget {

  @override
  _ViewEmployeesState createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployeesPage> {

  List<Employee> _employees = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    EmployeeApi.fetchEmployees().then((employees){
      setState(() {
        _employees = employees; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Employee employee = _employees[index]; 
                    return EmployeeListTile(employee: employee);
                }, 
                childCount: _employees == null ? 0: _employees.length,
             ),), 
          ]
      ),
    );
  }
}