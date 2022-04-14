import 'package:http/http.dart' as http;
import '../models/condition.dart'; 
import 'dart:async';
import 'dart:convert';


class MedicalConditionApi {


    createMedicalCondition(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/conditions');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'name': formData['name'],
                'code': formData['code']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Patient');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }


    static diagnoseCondition(int? patientId, int? conditionId) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/diagnosePatient');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'patient_id': patientId,
                'condition_id': conditionId
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Patient');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }


    static Future<List<Condition>> fetchConditions() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/conditions'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Condition> conditions = conditionFromJson(response.body);
            return conditions;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


}