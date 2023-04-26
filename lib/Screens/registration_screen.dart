import 'package:flutter/material.dart';
import 'package:saline_monitor/Screens/saline_list.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationScreenState();
  }
}

Widget createFromTextField(String fieldName) {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 30),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "${fieldName}",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {}
      },
    ),
  );
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //decoration: const BoxDecoration(
      //  image: DecorationImage(
      //    image: AssetImage(
      //      'lib/assets/4049049.jpg',
      //    ),fit: BoxFit.cover
      //  ),
      //),
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/plus.png",
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "SalineX Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 132, 132, 132),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            createFromTextField("Email Address"),
            createFromTextField("Password"),
            const SizedBox(
              height: 50,
            ),
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) {
                          return SalineList();
                        },
                      ),
                    );
                  },
                  child: Text('Login'),
                ))
          ],
        ),
      ),
    );
  }
}
