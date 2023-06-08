import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SalineBottle{
 final String salineBottleId;
 final String bedNumber;
 final double salinLevel;
 
 String get getSalineBottleId => this.salineBottleId;


  String get getBedNumber => this.bedNumber;


  double get getSalinLevel => this.salinLevel;

 
 SalineBottle({required this.salineBottleId,required this.bedNumber, required this.salinLevel});



}

class SalineBottleProvider with ChangeNotifier{
 
  List<SalineBottle> salineBottleList=[];

  


}