import 'package:flutter/material.dart';

import 'employees/EmployeesScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to RR',
      theme: ThemeData(primaryColor: Colors.lightBlue[800]),
      debugShowCheckedModeBanner: false,
      home: EmployeesScreen(),
    );
  }
}