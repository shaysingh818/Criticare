import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../models/medication.dart'; 


class MedicationApi {

    createMedication(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/medications');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'name': formData['name'],
                'code': formData['code'], 
                'price': formData['price']
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

     static prescribeMedication(int? patientId, int? medicationId) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/prescribeMedication');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'patient_id': patientId,
                'medication_id': medicationId
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

    static Future<List<Medication>> fetchMedications() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/medications'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Medication> medications = medicationFromJson(response.body);
            return medications;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


}