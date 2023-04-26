import 'package:flutter/material.dart';
import 'package:saline_monitor/Screens/registration_screen.dart';
import 'package:saline_monitor/Appbar/appbar.dart';
import 'package:saline_monitor/Screens/saline_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home:  MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        child:SalineAppBar(),
        preferredSize: Size.fromHeight(100),
      ) ,
      body:Center(child: SingleChildScrollView(child: RegistrationScreen())) ,
    );
  }
}
