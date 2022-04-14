import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'api/employee.dart';
import 'base.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  EmployeeApi _action = EmployeeApi(); 

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();

  submitLoginData() async {

    // login data
     Map <String, dynamic> loginApiData =  {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text    
    }; 

    int status = await _action.logIn(loginApiData);
    if(status > 0){
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage())); 
    }else{
      print("Failed to log in"); 
    }


  }


  Container submitButton(){
    return Container(
        height: 55, 
        width: 200, 
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Center(
              child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16 
                  ),
              ),
          ),
    );
  }


  TextFormField textFieldWidget(String title, IconData icon, TextEditingController txtController){
    return TextFormField(
        controller: txtController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.grey[100],
            filled: true, 
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            hintText: title, 
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon)
        ),
    );
  }

  Container headerSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Container(
        width: 600,
        child: Center(
          child: Column(
            children: <Widget> [
              SizedBox(height: 40.0),
              ListTile(
                title: Text('Criticare LLC',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                  )
                ),
                subtitle: Text(
                  'Criticare LLC', style: TextStyle(color: Colors.grey, fontSize: 15)
                ),
                leading: Icon(
                  Icons.water_damage, 
                  color: Colors.red,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Container textSection(){
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.only(top: 30.0),
          child: Center(
              child: Column(
                  children: <Widget> [
                     SizedBox(height: 20.0),
                     textFieldWidget("First Name: ", Icons.person, firstNameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Last Name", Icons.person, lastNameController),
                  ]
              ),
          ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: (){
            setState(() {
      
            });
          },
        ),
        backgroundColor: Colors.red, 
        title: Text('Login', style: TextStyle(color: Colors.white),),
      ),
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white, 
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget> [
                  SizedBox(height: 50),
                  headerSection(),
                  SizedBox(height: 30),
                  textSection(),
                  SizedBox(height: 20),
                   GestureDetector(
                    onTap: (){
                        submitLoginData();
                    },
                    child: submitButton(), 
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