import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/room.dart';
import '../inserts/insert_procedure.dart';
import '../api/room.dart';
import '../models/intake.dart';



class RoomTile extends StatefulWidget {

  final Intake? intake;
  final Room? room;
  const RoomTile({Key? key, @required this.room, @required this.intake}) : super(key: key);


  @override
  _RoomTileState createState() => _RoomTileState(room: this.room, intake: this.intake);

}

class _RoomTileState extends State<RoomTile> {

  Room? room; 
  Intake? intake; 
  _RoomTileState({this.room, this.intake});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertProcedurePage(room: room, intake: intake)));
          }, 
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.center, 
              padding: const EdgeInsets.all(8),
              child: Column(
                  children: <Widget> [
                      SizedBox(height: 30), 
                      Icon(
                          Icons.location_city,
                          color: Colors.red, 
                          size: 100,
                      ), 
                      SizedBox(height: 10.0), 
                      Text('${room?.roomNumber}', style: TextStyle(color: Colors.red, fontSize: 30)),
                      SizedBox(height: 15.0), 
                      Text('\$ ${room?.cost}', style: TextStyle(color: Colors.green, fontSize: 20)),
                  ],
              ),
              color: Colors.grey[200],
          ),
        )
      )

    );
  }
}