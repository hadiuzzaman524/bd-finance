import 'package:flutter/material.dart';

class CustomerVisitCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Function function;

  CustomerVisitCard(
      {@required this.imageUrl,
      @required this.title,
      @required this.function,
      @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 150,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
