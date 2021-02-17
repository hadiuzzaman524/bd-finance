import 'package:flutter/material.dart';

import '../models/data_handelar.dart';
import '../screens/contact.dart';
import 'deposit_information_card.dart';

class Loan extends StatelessWidget {
  final handler = DataHandelar();

  @override
  Widget build(BuildContext context) {
    final list = handler.loanList;

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return DepositInformationCard(
            imageUrl: list[index].imageUrl,
            title: list[index].title,
            function: () {
              Navigator.pushNamed(context, Contact.routeName);
            },
            subtitle: list[index].subtitle,
          );
        },
      ),
    );
  }
}
