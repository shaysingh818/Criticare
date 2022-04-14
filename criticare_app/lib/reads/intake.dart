import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/intake.dart'; 
import '../api/intake.dart';
import '../list_tiles/intake.dart';

class ViewIntakePage extends StatefulWidget {

  @override
  _ViewIntakeState createState() => _ViewIntakeState();
}

class _ViewIntakeState extends State<ViewIntakePage> {

  List<Intake> _intake = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    IntakeApi.fetchIntakePatients().then((intake){
      setState(() {
        _intake = intake; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Intake intake = _intake[index]; 
                    return IntakeListTile(intake: intake);
                }, 
                childCount: _intake == null ? 0: _intake.length,
             ),), 
          ]
      ),
    );
  }
}