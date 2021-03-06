import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';
import '../constants/constants.dart';
import '../widgets/button.dart';

class CustomerDetails extends StatelessWidget {
  static const routeName = "/CustomerDetails";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: ListView(
          children: [
            CustomerInfoContainer(),
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 7,
                child: ListTile(
                  title: Text(
                    '01785304677',
                    style: titleStyle,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            CustomerDetailsContainer(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Follow up',
              style: titleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Interested',
                      style: titleStyle,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      onPressed: () {}),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CommonButton(
                title: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPress: () {}),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class CustomerDetailsContainer extends StatelessWidget {
  const CustomerDetailsContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Customer Detail',
                      style: titleStyle,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomerInfoContainer extends StatelessWidget {
  const CustomerInfoContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Card(
                  elevation: 7,
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: circleAvaterColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
