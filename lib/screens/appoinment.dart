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
  String _currentSelectedValue;

  var _currencies = [
    "01/03/2021: 3.30PM",
    "02/03/2021: 4.30PM",
    "03/03/2021: 3.30PM",
    "04/03/2021: 3.30PM",
    "05/03/2021: 3.30PM",
    "06/03/2021: 3.12PM",
  ];

  String name;
  String mobile="";
  String dateTime;
  String message;

  _savedForm(){
    _formKey.currentState.save();
    _formKey.currentState.validate();
    print(mobile);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Appoinment", style: appBarTextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobile",
                  style: labelStyle,
                ),
                SizedBox(
                  height: _height,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'eg: 017',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Please Enter Your Mobile Number";
                    }
                    return null;
                  },
                  onChanged: (value){
                    print(value);
                  },
                  onSaved: (value){
                    mobile=value;
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
                  decoration: InputDecoration(
                    hintText: 'eg: Jaison Justus',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _elementgap,
                ),
                Text(
                  "Date Time",
                  style: labelStyle,
                ),
                SizedBox(
                  height: _height,
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: "01/08/2018: 3.30PM",
                          hintStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
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
                  decoration: InputDecoration(
                    hintText: 'Add your Message',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _elementgap,
                ),
                InkWell(
                  onTap: (){
                    print(mobile);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class Dropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
