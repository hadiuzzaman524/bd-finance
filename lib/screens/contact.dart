import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';

class Contact extends StatelessWidget {
  static const routeName="/Contacts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Details",style: appBarTextStyle,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
