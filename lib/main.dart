import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/sales_force.dart';
import './screens/appoinment.dart';
import './screens/bdf_products.dart';
import './screens/contact.dart';
import './screens/customer_detail.dart';
import './screens/login.dart';
import './constants/constants.dart';
import './screens/visit_detail.dart';
import 'screens/login.dart';
import 'screens/sales_force.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, stateSnapshoot) {
          if (stateSnapshoot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (stateSnapshoot.hasData) {
            return SalesForce();
          } else {
            return Login();
          }
        },
      ),
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
