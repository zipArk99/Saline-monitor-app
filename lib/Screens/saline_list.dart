import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saline_monitor/Appbar/appbar.dart';
import 'package:saline_monitor/Models/User.dart';
import 'package:saline_monitor/Screens/registration_screen.dart';
import 'package:saline_monitor/Service/SalineBottleServiceImp.dart';
import 'package:saline_monitor/main.dart';

class SalineList extends StatelessWidget {
  static const String salineListRoute = "/SalineListRoute";
  final SalinBottleServiceImp _salinBottleServiceImp =
      new SalinBottleServiceImp();
  final database = FirebaseDatabase.instance.ref('Hospital');

  Color percentageColor(double percentage) {
    if (percentage >= 80) {
      return const Color.fromARGB(255, 1, 59, 3);
    } else if (percentage < 80 && percentage >= 70) {
      return const Color.fromARGB(255, 2, 131, 6);
    } else if (percentage < 70 && percentage >= 60) {
      return const Color.fromARGB(255, 2, 210, 9);
    } else if (percentage < 60 && percentage >= 40) {
      return const Color.fromARGB(255, 250, 143, 3);
    } else if (percentage > 40 && percentage >= 20) {
      return const Color.fromARGB(255, 250, 98, 3);
    }
    return const Color.fromARGB(255, 244, 0, 0);
  }

  @override
  Widget build(BuildContext buildContext) {
    UserProvider userProvider =
        Provider.of<UserProvider>(buildContext, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SalineAppBar(),
      ),
      body: StreamBuilder(
        stream: database.onValue,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {}
          Map<Object?, Object?> salineData =
              snapshot.data!.snapshot.value as Map<Object?, Object?>;
          List<dynamic> list = [];
          list = salineData.values.toList();

          list.forEach((element) {
            print(element);
          });
          return ListView.builder(
            itemBuilder: (contx, pos) {
              double convertToPercentage =
                  (list[pos]['salinelevel'] / 500) * 100;
              int bedNumber = list[pos]['bednumber'];
              if (convertToPercentage <= 3) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Alert",
                            style: TextStyle(color: Colors.red),
                          ),
                          content: Text(
                              "Remove saline bottle from bed number $bedNumber!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Ok"))
                          ],
                        );
                      },
                    );
                  },
                );
              }

              return Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Saline Level :',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      "${convertToPercentage.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: percentageColor(convertToPercentage),
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text(
                        list[pos]['bednumber'].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    textColor: Colors.amberAccent,
                  ),
                ),
              );
            },
            itemCount: snapshot.data?.snapshot.children.length,
          );
        }),
      ),
      floatingActionButton: Container(
        width: 120,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          onPressed: () {
            Navigator.of(buildContext).pushReplacementNamed(MyApp.myAppRoute);
          },
          child: const Text("LogOut"),
        ),
      ),
    );
  }
}
