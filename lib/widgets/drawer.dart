import 'package:bd_finance/screens/appoinment.dart';
import 'package:bd_finance/screens/bdf_products.dart';
import 'package:bd_finance/screens/contact.dart';
import 'package:bd_finance/screens/sales_force.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, SalesForce.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ),
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
          Divider(),
          FlatButton(
            onPressed: () async {
              // Navigator.pushReplacementNamed(context, RegistrationScreen.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
