import 'package:flutter/material.dart';

class DepositInformationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Function function;

  DepositInformationCard(
      {@required this.imageUrl,
      @required this.title,
      @required this.function,
      @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 180,
      child: Card(
        elevation: 5,
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 99,
                        child: ListTile(
                          title: Text(
                            title,
                            overflow: TextOverflow.clip,
                          ),
                          subtitle: Text(subtitle),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: function,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).buttonColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 20),
                                child: Text(
                                  'Select',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
