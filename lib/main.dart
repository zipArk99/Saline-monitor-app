import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saline_monitor/Models/User.dart';
import 'package:saline_monitor/Screens/registration_screen.dart';
import 'package:saline_monitor/Appbar/appbar.dart';
import 'package:saline_monitor/Screens/saline_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String myAppRoute='/MyAppRoute';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=> UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreen(),
        initialRoute: "/",
        routes: {
          myAppRoute:(context)=>MyApp(),
          RegistrationScreen.registrationScreenRoute:  (context) => RegistrationScreen(),
          SalineList.salineListRoute: (context) => SalineList(),
        }, 
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: SingleChildScrollView(
          child: RegistrationScreen(),
        ),
      ),
    );
  }
}
