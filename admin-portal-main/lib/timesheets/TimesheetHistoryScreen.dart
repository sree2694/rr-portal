import 'package:enf_timesheets/dumps/Timesheets_dump.dart';
import 'package:enf_timesheets/employees/Employee.dart';
import 'package:enf_timesheets/timesheets/Timesheet.dart';
import 'package:flutter/material.dart';

class TimesheetHistoryScreen extends StatefulWidget {
  final Employee employee;

  TimesheetHistoryScreen({required this.employee});

  @override
  _TimesheetHistoryScreenState createState() => _TimesheetHistoryScreenState();
}

class _TimesheetHistoryScreenState extends State<TimesheetHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);
    List<Timesheet> timesheets = TMS_DUMP;
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Timesheet History',
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Table(border: TableBorder.symmetric(), children: [
            TableRow(children: [
              // new Expanded(
              //     child:
              TextFormField(
                style: textStyle,
                initialValue: 'Week End Date',
                enabled: false,
                // )
              ),
              // new Expanded(
              //     child:
              TextFormField(
                style: textStyle,
                initialValue: 'Client',
                enabled: false,
                // )
              ),
              // new Expanded(
              //     child:
              TextFormField(
                style: textStyle,
                initialValue: 'Hours',
                enabled: false,
                // )
              ),
              // new Expanded(
              //     child:
              TextFormField(
                style: textStyle,
                initialValue: 'Status',
                enabled: false,
                // )
              ),
              // new Expanded(
              //     child:
              TextFormField(
                style: textStyle,
                initialValue: 'Frequency',
                enabled: false,
                // )
              )
            ]),
            for (var timesheet in timesheets)
              TableRow(children: [
                // new Expanded(
                //     child:
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Week End Date'),
                  initialValue: timesheet.weekEndDate,
                  // )
                ),
                // new Expanded(
                //     child:
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Client'),
                  initialValue: timesheet.client,
                  // )
                ),
                // new Expanded(
                //     child:
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Hours'),
                  initialValue: timesheet.hours,
                  // )
                ),
                // new Expanded(
                //     child:
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Status'),
                  initialValue: timesheet.status,
                  // )
                ),
                // new Expanded(
                //     child:
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Frequency'),
                  initialValue: timesheet.frequency,
                  // )
                )
              ]),
          ]))
    ]);
  }
}
