import 'package:enf_timesheets/employees/EmployeesScreen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              // color: Colors.lightBlue,
                image: DecorationImage(
                    image: AssetImage("lib/images/SmallLogo.jpg"),
                    // fit: BoxFit.cover
                )
            ), child: null,
                       // child: Text('RR Software Solutions'),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmployeesScreen()));
            },
          ),
          ListTile(
            title: Text('Employees'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmployeesScreen()));
            },
          )
        ],
      ),
    );
  }
}
