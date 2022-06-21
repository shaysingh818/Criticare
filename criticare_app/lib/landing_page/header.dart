import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HeaderLanding extends StatefulWidget {

  final String? header; 
  final String? subheader; 

  const HeaderLanding({Key? key, @required this.header, @required this.subheader}) : super(key: key);

  @override
  _HeaderLandingState createState() => _HeaderLandingState(header: this.header, subheader: this.subheader);
}

class _HeaderLandingState extends State<HeaderLanding> {

  String? header; 
  String? subheader; 

  _HeaderLandingState({this.header, this.subheader});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Container(
        width: 600,
        child: Center(
          child: Column(
            children: <Widget> [
              Icon(
                Icons.add_box_rounded, 
                color: Colors.red,
                size: 150,
              ),
              Text("${header}", style: TextStyle(color: Colors.red, fontSize: 60)), 
              SizedBox(height: 10), 
              Text("${subheader}", style: TextStyle(color: Colors.grey, fontSize: 15)), 

            ],
          ),
        ),
      ),
    );
  }
}