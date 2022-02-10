import 'package:enf_timesheets/drawer/CustomDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Success page'),
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
            children: <Widget>[

            new Text("Employee Added..."),
             new ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    primary: Colors.blue),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text('\nLogin'),
              ),
            ]
        ),)
    );
  }
}
