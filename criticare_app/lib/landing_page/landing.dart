import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'footer.dart'; 
import 'header.dart'; 

class LandingPage extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white, 
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget> [
                  SizedBox(height: 50),
                  /* custom header */ 
                  HeaderLanding(
                   header: "Criticare",
                   subheader: "Critical medical solutions for everyone" 
                  ),
                  SizedBox(height: 30),
                  
                  /* flexible footer widget */ 
                  Flexible(
                    child: FooterLanding(),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}