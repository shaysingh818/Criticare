import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FooterLanding extends StatefulWidget {


  @override
  _FooterLandingState createState() => _FooterLandingState();
}

class _FooterLandingState extends State<FooterLanding> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0)
        ),
        color: Colors.red, 
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(top: 30.0),
        child: Center(
            child: Column(
                children: <Widget> [
                
                ]
            ),
        ),
    );
  }
}