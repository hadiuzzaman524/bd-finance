import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double margin;
  final Function onPress;

  const GridItem({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.margin,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
              child: Image.asset(
                imageUrl,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
