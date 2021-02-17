import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/deposit.dart';
import '../widgets/loan.dart';

class BDFProducts extends StatefulWidget {
  static const routeName = "/BDFProducts";

  @override
  _BDFProductsState createState() => _BDFProductsState();
}

class _BDFProductsState extends State<BDFProducts>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<TabData> _tabData;
  List<Tab> _tabs = [];
  Color _activeColor;

  @override
  void initState() {
    super.initState();
    _tabData = [
      TabData(title: 'Deposit', color: Color(0xffc7c7c7)),
      TabData(title: 'Loan', color: Color(0xff9a9a9a)),
    ];
    _activeColor = _tabData.first.color;
    _tabData.forEach((data) {
      final tab = Tab(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: data.color,
          child: Center(
            child: Text(
              data.title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      _tabs.add(tab);
    });
    _controller = TabController(vsync: this, length: _tabData.length)
      ..addListener(() {
        setState(() {
          _activeColor = _tabData[_controller.index].color;
        });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        bottom: TabBar(
          indicatorColor: _activeColor,
          labelPadding: EdgeInsets.zero,
          controller: _controller,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Deposit(),
          Loan(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class TabData {
  TabData({this.title, this.color});

  final String title;
  final Color color;
}
