import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';

class BDFProducts extends StatelessWidget {
  static const routeName = "/BDFProducts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Products",
            style: appBarTextStyle,
          ),
         ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
