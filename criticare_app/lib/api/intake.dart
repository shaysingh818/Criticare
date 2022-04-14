import 'package:http/http.dart' as http; 
import '../models/intake.dart'; 
import 'dart:async';
import 'dart:convert';


class IntakeApi {


    createIntake(Map<String, dynamic> formData, int? patientId) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/intakePatient');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'patient_id': patientId, 
                'blood_pressure': formData['bloodPressure'], 
                'notes': formData['notes']
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

    static Future<List<Intake>> fetchIntakePatients() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/intakePatient'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Intake> intakePatients = intakeFromJson(response.body);
            return intakePatients;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }

}