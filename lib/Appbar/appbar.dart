import 'package:flutter/material.dart';

class SalineAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext contx){
    return  AppBar(
        toolbarHeight:80,
        title: const Center(child:Text("SalineX"),),

        elevation: 20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
          )
        ),
      );
  }
}