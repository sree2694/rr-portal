import 'dart:convert';
import 'dart:io';

import 'package:enf_timesheets/employees/EmployeesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Employee.dart';

class Login extends StatelessWidget with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();


  // Future<void> Authentication(
  //     String email, String password) async {
  //   try {
  //     final url = 'http://localhost:8080/adminemp';
  //
  //     final responce = await http.post(url,
  //         body: json.encode({
  //           'email': email,
  //           'password': password,
  //                    })
  //     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOGIN'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EmployeesScreen()));
                      },
                      child: Image.asset('lib/images/logo.png')),
                ),
                const SizedBox(height: 50),
                Container(
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (email) {
                      if (isEmailValid(email!))
                        return null;
                      else
                        return 'Enter a valid email address';
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    maxLength: 20,
                    obscureText: true,
                    validator: (password) {
                      if (isPasswordValid(password!))
                        return null;
                      else
                        return 'Enter a valid password';
                    },
                  ),
                ),
                Container(
                    child: ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // use the email provided here
                          }
                        },
                        child: Text("Submit"))),
              ],
            ),
          ),
        ));
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 20;

  bool isEmailValid(String email) {
    Pattern pattern =
        '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
    RegExp regex = new RegExp(email);
    return regex.hasMatch(email);
  }
}
