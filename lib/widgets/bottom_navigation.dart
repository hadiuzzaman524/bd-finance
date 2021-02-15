import 'package:flutter/material.dart';

import '../screens/appoinment.dart';
import '../screens/bdf_products.dart';
import '../screens/sales_force.dart';
import '../screens/visit_detail.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Appoinment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Visits',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.grey,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          switch (value) {
            case 0:
              Navigator.pushReplacementNamed(context, SalesForce.routeName);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, BDFProducts.routeName);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, Appoinment.routeName);
              break;
            case 3:
              Navigator.pushReplacementNamed(context, VisitDetails.routeName);
              break;
          }
        });
      },
    );
  }
}
