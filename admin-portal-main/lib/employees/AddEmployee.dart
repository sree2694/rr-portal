import 'dart:convert';

import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:enf_timesheets/employees/SuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Employee.dart';

class AddEmployee extends StatelessWidget {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  // TextEditingController client = new TextEditingController();
  // TextEditingController vendor = new TextEditingController();
  // TextEditingController payrent = new TextEditingController();

  List<Employee> existingEmployees;

  AddEmployee({required this.existingEmployees});

  Employee employeeAdd = Employee("", "", "", "", "", "","");

  @override
  Widget build(BuildContext context) {
    // List<Employee> newEmployees = [];
    // EmployeeAdd employeeAdd;
    final ButtonStyle addStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return new Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Add Employee"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.blue],
                stops: [0.5, 1.0],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    new TextFormField(
                      controller: firstName,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      controller: dob,
                      decoration: const InputDecoration(
                        labelText: 'DOB',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    new TextFormField(
                      controller: gender,
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                    ),

                    // new Text(
                    //   'Employment Details',
                    //   style: TextStyle(
                    //       height: 2, fontWeight: FontWeight.bold, fontSize: 20),
                    // ),
                    // new TextFormField(
                    //   controller: client,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Client',
                    //   ),
                    // ),
                    // new TextFormField(
                    //   controller: vendor,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Vendor',
                    //   ),
                    // ),
                    // new TextFormField(
                    //   controller: payrent,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Pay Rate',
                    //   ),
                    // ),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: addStyle,
                              onPressed: () {
                                addEmp(
                                  firstName.text,
                                  lastName.text,
                                  dob.text,
                                  gender.text,
                                  email.text,
                                  phoneNumber.text,

                                  // client.text,
                                  // vendor.text,
                                  // payrent.text,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SuccessPage()),
                                );
                              },
                              child: const Text('Add'),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  primary: Colors.red),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ))
                  ],
                )))));
  }

  addEmp(String firstName,String lastName,String dob,String gender, String email, String phoneNumber) async {
    var res = await http.post(Uri.parse("http://localhost:8082/api/employee"),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        },
        body: json.encode({
          'firstName': firstName,
          'lastName': lastName,
          'dob': dob,
          'gender': gender,
          'email': email,
          'phone': phoneNumber,

          // 'client': employeeAdd.client,
          // 'vendor': employeeAdd.vendor,
          // 'payrate': employeeAdd.payrate,

          // 'firstName': 'sree',
          // 'lastName': 'j',
          // 'dob': '26-01-1995',
          // 'gender': 'male',
          // 'email': 'sreekan',
        }));
    print(res != null ? res : null);

    print(res.statusCode);

    if (res.statusCode < 200 || res.statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    print(res.body);

    // return Post.fromJson(json.decode(response.body));
  }
}
