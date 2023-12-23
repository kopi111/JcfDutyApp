import 'package:flutter/material.dart';
import 'package:Duty_App/Home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return const MaterialApp(
   debugShowCheckedModeBanner: false,
      title: "Duty App",
      home : Home(),
    );
  }

}