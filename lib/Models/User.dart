import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class User {
  final String userEmail;
  final String userPassword;
  final String tokenId;
  final DateTime expiresIn;
  get getUserEmail => this.userEmail;

  get getUserPassword => this.userPassword;

  get getTokenId => this.tokenId;

  get getExpiresIn => this.expiresIn;

  User(
      {required this.userEmail,
      required this.userPassword,
      required this.tokenId,
      required this.expiresIn});
}

class UserProvider with ChangeNotifier {
  static var url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${Api.apiKey}");

  Future<bool> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "email": emailAddress,
            "password": password,
            "returnSecureToken": false,
          },
        ),
      );

      if (response.statusCode >= 400) {
        print(response.body);
        print("error caught::${response.statusCode}");
        return false;
      }
      print(response.body);

      var decodeJsonString = json.decode(response.body) as Map<String, dynamic>;
    } catch (error) {
      print("Exception occured while signing with email and password::$error");
      return false;
    }
    return true;
  }

  final database = FirebaseDatabase.instance.ref();

  Future<void> randomFun1() async {
    try{
    print("--Called--");
    final randomVar1 = database.child('/salineList');
    randomVar1.set(
      {
        "salineBottleId": 10,
        "bedNumber": 210,
        "salineLevel": 26.2
      },
    );
      print("Successful");
    }catch(error){
      print("error occured :: $error");
    }
  }

}
