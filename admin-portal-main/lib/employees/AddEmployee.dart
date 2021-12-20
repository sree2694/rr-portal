import 'dart:convert';

import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:enf_timesheets/employees/EmployeeAdd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Employee.dart';

class AddEmployee extends StatelessWidget {

  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController client = new TextEditingController();
  TextEditingController vendor = new TextEditingController();
  TextEditingController payrent = new TextEditingController();
  TextEditingController frequency = new TextEditingController();
   List<Employee> existingEmployees;

  AddEmployee({required this.existingEmployees});
EmployeeAdd employeeAdd = EmployeeAdd("","","","","","","");
Future save() async{
  var res = await http.post(Uri.parse("http://localhost:8080/api/employee"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
'firstName': employeeAdd.firstName,
        'phone': employeeAdd.phone,
        'email': employeeAdd.email,
        'client': employeeAdd.client,
        'vendor': employeeAdd.vendor,
        'payrate': employeeAdd.payrate,
        'frequency': employeeAdd.frequency
      }));

}
  @override
  Widget build(BuildContext context) {
    List<Employee> newEmployees = [];
    final ButtonStyle addStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return new Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Add Employee"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.blue], stops: [0.5, 1.0],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView
       ( child:Column(
          children: <Widget>[
            new TextFormField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            new TextFormField(
              controller: phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.number,
            ),
            new TextFormField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.number,
            ),
            new Text(
              'Employment Details',
              style: TextStyle(
                  height: 2, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            new TextFormField(
              controller: client,
              decoration: const InputDecoration(
                labelText: 'Client',
              ),
            ),
            new TextFormField(
              controller: vendor,
              decoration: const InputDecoration(
                labelText: 'Vendor',
              ),
            ),
            new TextFormField(
              controller: payrent,
              decoration: const InputDecoration(
                labelText: 'Pay Rate',
              ),
            ),
            new TextFormField(
              controller: frequency,
              decoration: const InputDecoration(
                labelText: 'Frequency',
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: addStyle,
                      onPressed: () {
                        addEmp(newEmployees, name.text, client.text, phone.text,
                            email.text, vendor.text,payrent.text,frequency.text);
                      },
                      child: const Text('Add'),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
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
        )));
  }

  void addEmp(List<Employee> newEmployees, String name, String client,
      String phone, String email, String vendor, String payrate, String frequency) {
   EmployeeAdd employeeAdd = newEmployees as EmployeeAdd;

  }
}
