import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:enf_timesheets/employees/AddEmployee.dart';
import 'package:flutter/material.dart';

import '../dumps/Employee_dump.dart';
import 'Employee.dart';
import 'EmployeeDetailScreen.dart';

class EmployeesScreen extends StatefulWidget {
  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  List<Employee> newEmployees = [];
  List<Employee> existingEmployees = EMP_DUMP;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.blue], stops: [0.5, 1.0],
            ),
          ),
        ),

      ),
      drawer: CustomDrawer(),
      body: _buildEmployees(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddEmployee(
                        existingEmployees: existingEmployees,
                      )));
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmployees() {
    return GridView.builder(
      itemCount: EMP_DUMP.length * 2,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 3.0),
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // existingEmployees.addAll(newEmployees);
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        return _buildRow(existingEmployees[index]);
      },
    );
  }

  Widget _buildRow(Employee pair) {
    return ListTile(
      title: Text(
        pair.name.toUpperCase(),
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployeeDetailScreen(employee: pair)));
      },
      subtitle: Text("Status: " + pair.status.toUpperCase()),
    );
  }
}
