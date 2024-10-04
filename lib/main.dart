import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencedemo/DashBoardScreen.dart';

import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String email = "";
  @override
  void initState() {
    super.initState();
    loadPreferenceData();

  }

  Future<void> loadPreferenceData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("email") ?? "No Email Saved";
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SharedPreferenceDemo",
      home: email == "No Email Saved" ? const LoginScreen() : const DashBoardScreen());

  }
}
