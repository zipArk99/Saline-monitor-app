import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saline_monitor/Models/User.dart';
import 'package:saline_monitor/Screens/saline_list.dart';

class RegistrationScreen extends StatefulWidget {
  static const String registrationScreenRoute = "/RegistrationScreenRoute";
  @override
  State<StatefulWidget> createState() {
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var userDetails = {
    'email': '',
    'password': '',
  };
  Widget createFromTextField(String fieldName, TextInputType keyboardType,
      bool isPassword, String field) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: "${fieldName}",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return "${fieldName} is Empty";
          }
          return null;
        },
        onSaved: (value) {
          userDetails['$field'] = value!;
        },
      ),
    );
  }

  void OnLogin() async {
    setState(() {
      isLoading = true;
    });
    bool formValidation = _formKey.currentState!.validate();
    if (!formValidation) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    _formKey.currentState!.save();

    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    bool isSuccessful = await userProvider.signInWithEmailAndPassword(
      userDetails['email'].toString(),
      userDetails['password'].toString(),
    );

    if (isSuccessful) {
      Navigator.of(context).pushReplacementNamed(SalineList.salineListRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Unsuccessful"),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

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
            createFromTextField(
                "Email Address", TextInputType.emailAddress, false, 'email'),
            createFromTextField(
                "Password", TextInputType.text, true, 'password'),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: !isLoading
                  ? ElevatedButton(
                      onPressed: () {
                        OnLogin();
                      },
                      child: const Text('Login'),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
