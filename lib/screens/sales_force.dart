import 'package:bd_finance/screens/appoinment.dart';
import 'package:bd_finance/screens/contact.dart';
import 'package:bd_finance/screens/customer_detail.dart';
import 'package:bd_finance/screens/visit_detail.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../constants/constants.dart';
import '../widgets/griditem.dart';
import '../models/sales_forces_items.dart';
import 'bdf_products.dart';
import '../widgets/bottom_navigation.dart';

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
                    Navigator.pushNamed(context, VisitDetails.routeName);
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
