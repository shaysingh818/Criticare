// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
    Employee({
        required this.employeeId,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.permissionId,
    });

    int? employeeId;
    String? firstName;
    String? middleName;
    String? lastName;
    int? permissionId;

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["employee_id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        permissionId: json["permission_id"],
    );

    Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "permission_id": permissionId,
    };
}
