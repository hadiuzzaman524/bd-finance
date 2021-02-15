import 'package:bd_finance/constants/constants.dart';
import 'package:flutter/material.dart';

import './screens/sales_force.dart';
import './screens/appoinment.dart';
import './screens/bdf_products.dart';
import './screens/contact.dart';
import './screens/customer_detail.dart';
import './screens/login.dart';
import './screens/visit_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffdee4eb),
        accentColor: Color(0xfff9fafc),
        buttonColor: Color(0xff9a9a9a),
        primaryIconTheme: IconThemeData(
          color: textColor,
        ),
      ),
      home: SalesForce(),
      routes: {
        SalesForce.routeName: (ctx) => SalesForce(),
        Appoinment.routeName: (ctx) => Appoinment(),
        BDFProducts.routeName: (ctx) => BDFProducts(),
        Contact.routeName: (ctx) => Contact(),
        CustomerDetails.routeName: (ctx) => CustomerDetails(),
        Login.routeName: (ctx) => Login(),
        VisitDetails.routeName: (ctx) => VisitDetails(),
      },
    );
  }
}
