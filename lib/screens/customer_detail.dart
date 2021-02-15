import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';

class CustomerDetails extends StatelessWidget {
  static const routeName="/CustomerDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
