import 'package:bd_finance/models/data_handelar.dart';
import 'package:bd_finance/screens/customer_detail.dart';
import 'package:bd_finance/widgets/customer_visit_card.dart';
import 'package:bd_finance/widgets/deposit_information_card.dart';
import 'package:bd_finance/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';
import 'contact.dart';

class VisitDetails extends StatelessWidget {
  static const routeName = "/VisitDetails";
  final handler = DataHandelar();

  @override
  Widget build(BuildContext context) {
    final list = handler.visitUserList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer Visit",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomerVisitCard(
              imageUrl: list[index].imageUrl,
              title: list[index].title,
              function: () {
                Navigator.pushNamed(context, CustomerDetails.routeName);
              },
              subtitle: list[index].subtitle,
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
