import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../constants/constants.dart';
import '../widgets/griditem.dart';
import '../models/sales_forces_items.dart';
import 'bdf_products.dart';
import '../screens/appoinment.dart';
import '../screens/contact.dart';
import '../screens/visit_detail.dart';


class SalesForce extends StatelessWidget {
  static const routeName = "/SalesForce";
  final double margin = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sales Force",
          style: appBarTextStyle,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              if (1 == selectedValue) {
               FirebaseAuth.instance.signOut();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Log out'),
                value: 1,
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.only(left: margin, right: margin, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3.3,
          crossAxisSpacing: margin,
          children: salseForceItem.map((item) {
            return GridItem(
              margin: margin,
              title: item.title,
              imageUrl: item.imageUrl,
              onPress: () {
                switch (item.title) {
                  case "Deposit Products":
                    Navigator.pushNamed(context, BDFProducts.routeName);
                    break;
                  case "Loan Products":
                    Navigator.pushNamed(context, BDFProducts.routeName);
                    break;
                  case "Customer Info":
                    Navigator.pushNamed(context, Contact.routeName);
                    break;
                  case "All Visit":
                    Navigator.pushReplacementNamed(
                        context, VisitDetails.routeName);
                    break;
                  case "Appoinment":
                    Navigator.pushNamed(context, Appoinment.routeName);
                    break;
                }
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
