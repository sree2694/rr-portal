import 'dart:convert';

import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:enf_timesheets/employees/Employee.dart';
import 'package:enf_timesheets/timesheets/TimesheetHistoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'TimeSheetModel.dart';

class EmployeeDetailScreen extends StatefulWidget {
  final Employee employee;

  EmployeeDetailScreen({required this.employee});

  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String Date,clientname,hours;
  bool isloading=false;
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // late TimeSheetModel timeSheetModel;
  var reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _dateController=new TextEditingController();
  TextEditingController _statusController=new TextEditingController();
  TextEditingController _clientnameController=new TextEditingController();
  TextEditingController _hoursController=new TextEditingController();
  TextEditingController _frequencyController=new TextEditingController();


  TimeSheetModel timeSheetModel = TimeSheetModel("","","","","");


  Future save() async{
    var res = await http.post(Uri.parse("http://localhost:8080/api/employee"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'Date': timeSheetModel.Date,
          'clientname': timeSheetModel.clientname,
          'hours': timeSheetModel.hours,
          'frequency': timeSheetModel.frequency
        }));

  }

  List<String> items = <String>[
    'Approved',
    'Termed',
  ];
  String dropdownvalue = 'Approved';

  List<String> frequency = <String>[
    'Weekly',
    'Bi-weekly',
    'Monthly',
  ];
  String dropdown = 'Weekly';

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,

        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));

    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Details',
      theme: ThemeData(primaryColor: Colors.lightBlue[800]),
      home: buildEmployeeDetail(widget.employee),
    );
  }

  Widget buildEmployeeDetail(Employee employee) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final TextStyle textStyle =
        TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.blue],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              employee.name,
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Table(
              border: TableBorder.symmetric(),
              children: [
                TableRow(children: [
                  // new Expanded(
                  //     child:
                  TextFormField(
                    style: textStyle,
                    initialValue: 'Employee ID',
                    enabled: false,
                    // )
                  ),
                  // new Expanded(
                  //     child:
                  TextFormField(
                    style: textStyle,
                    initialValue: 'Employee Name',
                    enabled: false,
                    // )
                  ),
                  // new Expanded(
                  //     child:
                  TextFormField(
                    style: textStyle,
                    initialValue: 'Employee Job',
                    enabled: false,
                    // )
                  ),
                  // new Expanded(
                  //     child:
                  TextFormField(
                    style: textStyle,
                    initialValue: 'Employee Phone',
                    enabled: false,
                    // )
                  ),
                ]),
                TableRow(children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Employee Id'),
                    initialValue: employee.id,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter Employee Name'),
                    initialValue: employee.name,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter Job Status'),
                    initialValue: employee.status,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter Phone Num'),
                    initialValue: employee.phone,
                  )
                ])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TimesheetHistoryScreen(employee: employee),
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              key: _formKey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 16,
                              child: Padding(
                                padding: EdgeInsets.all(50.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    SizedBox(height: 20),
                                    Center(
                                        child: Text('Add TimeSheet History',
                                          textScaleFactor: 2,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      child: Row(

                                      children: [

                                        Text('Weekend Date: '),

                                        ElevatedButton(
                                          onPressed: () => _selectDate(context),

                                          child: Text('Select date'),

                                        ),


                                        SizedBox(
                                            child:Text(" ${currentDate.day}/${currentDate.month}/${currentDate.year}")

                                        ),
                                      ],
                                    )),
                                    SizedBox(height: 20),
                                      SizedBox(
                                        child: TextFormField(
                                         validator: (value) {
                                            return value!.isNotEmpty
                                                ? null
                                                : "Invalid Field";
                                          },
                                          controller: _clientnameController,
                                          decoration:
                                          InputDecoration(
                                              hintText: "Enter Client Name: "),
                                        ),
                                      ),
                                    SizedBox(height: 20),
                                SizedBox(
                                      child: TextFormField(

                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Invalid Field";
                                        },
                                        controller: _hoursController,
                                        decoration: InputDecoration(
                                            hintText: "Enter Hours: "),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                   SizedBox(
                                      child: Row(
                                        children: [
                                          new Text("Status :  "),
                                          new DropdownButton<String>(
                                            onChanged: (String? newValue) {
                                              controller: _statusController;
                                              setState(() {
                                                dropdownvalue = newValue!;
                                              });
                                            },
                                            value: dropdownvalue,

                                            items: items.map<
                                                DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          new Text("Frequency :  "),
                                          new DropdownButton<String>(
                                            onChanged: (String? newValue) {
                                              controller: _frequencyController;
                                              setState(() {
                                                dropdown = newValue!;
                                              });
                                            },
                                            value: dropdown,
                                            items: frequency.map<
                                                DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          textStyle: const TextStyle(fontSize: 20),
                                          primary: Colors.blue),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
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
      )),
    );
  }
}
