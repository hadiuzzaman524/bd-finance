import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../constants/constants.dart';

class SalesForce extends StatelessWidget {
  final double margin = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  margin: EdgeInsets.only(top: margin),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: circleAvaterColor,
                        child: Icon(
                          Icons.lock_clock,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tittle",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
