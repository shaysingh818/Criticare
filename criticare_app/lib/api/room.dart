import 'package:http/http.dart' as http;
import '../models/room.dart'; 
import 'dart:async';
import 'dart:convert';


class RoomApi {


    createRoom(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/room');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'room_number': formData['number'],
                'cost': formData['cost']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Hospital Room');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }


    static Future<List<Room>> fetchRooms() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/room'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Room> rooms = roomFromJson(response.body);
            return rooms;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


}