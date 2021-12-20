import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:flutter/material.dart';

class TimesheetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timesheet'),
      ),
      drawer: CustomDrawer(),
      body: Text("Timesheet here!"),
    );
  }
}
