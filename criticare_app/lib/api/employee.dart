import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/employee.dart'; 
import 'dart:async';
import 'dart:convert';


class EmployeeApi {


    createEmployee(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/employees');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'first_name': formData['firstName'], 
                'middle_name': formData['middleName'], 
                'last_name': formData['lastName'], 
                'permission_id': formData['permissionId']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Employee');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

    static Future<List<Employee>> fetchEmployees() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/employees'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Employee> employees = employeeFromJson(response.body);
            return employees;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


     Future<int> logIn(Map<String, dynamic> formData) async {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/login');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'first_name': formData['first_name'], 
                'last_name': formData['last_name']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
             var jsonData = json.decode(response.body);
             final permission_id = jsonData['permission_id'];
             
             prefs.setInt("permission_id", permission_id); 
             return permission_id; 
        } else {
            return 0; 
        }

    }

}