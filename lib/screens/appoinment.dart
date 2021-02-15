import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';
class Appoinment extends StatelessWidget {
  static const routeName="/Appoinment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Appoinment",style: appBarTextStyle),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
