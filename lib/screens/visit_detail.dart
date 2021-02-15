import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';


class VisitDetails extends StatelessWidget {

  static const routeName="/VisitDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Visit",style: appBarTextStyle,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
