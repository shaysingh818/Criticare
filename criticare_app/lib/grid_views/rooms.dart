import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/room.dart';
import '../models/room.dart';
import '../models/intake.dart';
import 'room_tile.dart'; 


class RoomPage extends StatefulWidget {


  final Intake? intake;
  const RoomPage({Key? key, @required this.intake}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState(intake: this.intake);
}

class _RoomPageState extends State<RoomPage> {

   Intake? intake; 
  _RoomPageState({this.intake});

  List<Room> _rooms = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    RoomApi.fetchRooms().then((rooms){
      setState(() {
        _rooms = rooms; 
        is_loading = false; 
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rooms"),
        backgroundColor: Colors.red
      ),
      body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            itemCount: _rooms == null ? 0: _rooms.length,
            itemBuilder: (BuildContext context, int index) {
                Room room = _rooms[index];
                return RoomTile(room: room, intake: intake);
            }
        ),
    );
  }
}