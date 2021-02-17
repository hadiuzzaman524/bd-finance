import 'package:flutter/material.dart';

import '../screens/appoinment.dart';
import '../screens/bdf_products.dart';
import '../screens/contact.dart';
import '../screens/sales_force.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Theme.of(context).buttonColor,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'bd finance',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, SalesForce.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, BDFProducts.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('Deposit Products'),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, BDFProducts.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('Loan Products'),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Contact.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('Customer Info'),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, Appoinment.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('Appointment'),
            ),
          ),
        ],
      ),
    );
  }
}
