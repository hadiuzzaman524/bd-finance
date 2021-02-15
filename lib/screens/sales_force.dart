import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../constants/constants.dart';
import '../widgets/griditem.dart';
import '../models/sales_forces_items.dart';

class SalesForce extends StatelessWidget {
  final double margin = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sales Force",
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
      ),
      body: Container(
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
                print("Call");
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
