import 'package:http/http.dart' as http;
import '../models/procedure.dart'; 
import 'dart:async';
import 'dart:convert';


class ProcedureApi {


    Future<int> createProcedure(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/procedures');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'room_id': formData['room_id'],
                'cost': formData['cost'],
                'notes': formData['notes'],
                'name': formData['name']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Procedure');
            var jsonData = json.decode(response.body); 
            return jsonData["insert_id"];
        } else {
            return 0; 
        }
    }

    static Future<Procedure> fetchProcedure(int? procedureId) async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/viewPatient?patient=${procedureId}'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            return Procedure.fromJson(jsonDecode(response.body));
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


    static assignProcedure(int? procedureId, int? intakeId) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/patientProcedure');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'intake_id': intakeId,
                'procedure_id': procedureId
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



}