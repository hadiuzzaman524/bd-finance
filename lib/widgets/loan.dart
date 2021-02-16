import 'package:bd_finance/screens/contact.dart';
import 'package:flutter/material.dart';

import 'deposit_information_card.dart';

class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++)
            DepositInformationCard(
              imageUrl:
                  "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI",
              title: "First Account",
              function: () {
                Navigator.pushNamed(context, Contact.routeName);
              },
              subtitle:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.",
            ),
        ],
      ),
    );
  }
}
