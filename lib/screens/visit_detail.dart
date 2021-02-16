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

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            for (int i = 0; i < 10; i++)
              CustomerVisitCard(
                imageUrl:
                    "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI",
                title: "First Account",
                function: () {
                  Navigator.pushNamed(context, CustomerDetails.routeName);
                },
                subtitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.",
              ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
