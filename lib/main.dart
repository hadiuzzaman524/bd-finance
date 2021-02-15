import 'package:flutter/material.dart';

import './screens/sales_force.dart';

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
      ),
      home: SalesForce(),
    );
  }
}
