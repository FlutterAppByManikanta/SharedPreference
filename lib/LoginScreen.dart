import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashBoardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveData() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = emailController.text;
    String password = passwordController.text;

    await sharedPreferences.setString("email", email);
    await sharedPreferences.setString("password",password);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data is Saved")));
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("LoginScreen",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Enter Your Email"),
            ),
          ),

          SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            child: TextField(
              obscureText: false,
              controller: passwordController,
              decoration: InputDecoration(labelText: "Enter Your Password"),
            ),
          ),


          SizedBox(height: 20,),

          ElevatedButton(onPressed: (){
            saveData();
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));

          }, child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 18),))



        ],),
    );
  }
}
