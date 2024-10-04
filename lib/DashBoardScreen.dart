import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencedemo/LoginScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  String email = "";

  @override
  void initState() {
    super.initState();
    loadPreferenceData();
  }

  Future<void> saveData() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = "No Email Saved";
    String password = "No Password Saved";

    await sharedPreferences.setString("email", email);
    await sharedPreferences.setString("password",password);

  }

  Future<void> loadPreferenceData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("email") ?? "No Email Saved";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("DashBoard",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            child: Text("Your Email is $email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
          ),

          SizedBox(height: 20,),

          ElevatedButton(onPressed: (){

            saveData();
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));


          }, child: Text("LOGOUT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 18),))


        ],),
    );
  }
}
