import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/medical_condition.dart';
import '../models/condition.dart';
import '../models/intake.dart';
import 'condition_tile.dart'; 


class ConditionPage extends StatefulWidget {


  final Intake? intake;
  const ConditionPage({Key? key, @required this.intake}) : super(key: key);

  @override
  _ConditionPageState createState() => _ConditionPageState(intake: this.intake);
}

class _ConditionPageState extends State<ConditionPage> {

   Intake? intake; 
  _ConditionPageState({this.intake});

  List<Condition> _conditions = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    MedicalConditionApi.fetchConditions().then((conditions){
      setState(() {
        _conditions = conditions; 
        is_loading = false; 
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conditions"),
        backgroundColor: Colors.red
      ),
      body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            itemCount: _conditions == null ? 0: _conditions.length,
            itemBuilder: (BuildContext context, int index) {
                Condition condition = _conditions[index];
                return ConditionTile(condition: condition, intake: intake);
            }
        ),
    );
  }
}