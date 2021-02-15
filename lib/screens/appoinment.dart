import 'package:bd_finance/widgets/button.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navigation.dart';

class Appoinment extends StatefulWidget {
  static const routeName = "/Appoinment";

  @override
  _AppoinmentState createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  final _formKey = GlobalKey<FormState>();
  final double _height = 8;
  final double _elementgap = 15;
  final _mobileFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _approximateFocus = FocusNode();

  String _name = "";
  String _mobile = "";
  String _message = "";
  DateTime _dateTime = DateTime.now();

  _saveForm() {
    _formKey.currentState.save();
    bool valid = _formKey.currentState.validate();

    if (valid) {
      print(_name);
      print(_mobile);
      print(_message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Appoinment", style: appBarTextStyle),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Mobile",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                focusNode: _mobileFocus,
                decoration: InputDecoration(
                  hintText: 'eg:017',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter mobile number";
                  }
                  return null;
                },
                onSaved: (value) {
                  _mobile = value;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_addressFocus);
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Name",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'eg: Jaison Justus ',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_mobileFocus);
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Message",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              TextFormField(
                maxLines: 7,
                textInputAction: TextInputAction.done,
                focusNode: _approximateFocus,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Add your Message',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please type message";
                  }
                  return null;
                },
                onSaved: (value) {
                  _message = value;
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              CommonButton(
                  title: "Submit",
                  onPress: () {
                    _saveForm();
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
