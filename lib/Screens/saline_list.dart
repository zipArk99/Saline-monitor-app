import 'package:flutter/material.dart';
import 'package:saline_monitor/Appbar/appbar.dart';
import 'package:saline_monitor/Service/SalineBottleServiceImp.dart';

class SalineList extends StatelessWidget {
final SalinBottleServiceImp _salinBottleServiceImp=new SalinBottleServiceImp();
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(100) ,
        child:SalineAppBar() ,
      ),
      body: ListView.builder(
        itemBuilder: (contx, pos) {
          return Card(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            elevation: 5,
            margin: const  EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30  ,
                  child: Text(
                    _salinBottleServiceImp.salinBottleList[pos].bedNumber,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                textColor: Colors.amberAccent,
              ),
            ),
          );
        },
        itemCount: _salinBottleServiceImp.salinBottleList.length,
      ),
    );
  }
}
