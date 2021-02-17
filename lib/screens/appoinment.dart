import 'package:bd_finance/models/client_appointment.dart';
import 'package:bd_finance/models/data_handelar.dart';
import 'package:bd_finance/widgets/button.dart';
import 'package:bd_finance/widgets/textfieldwithdropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

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

  final _nameFocus = FocusNode();
  final _messageFocus = FocusNode();

  String _name = "";
  String _mobile = "";
  String _message = "";
  String _dateTime = DateFormat.yMMMd().format(DateTime.now()).toString();

  DateTime currentDate = DateTime.now();
  final handelar = DataHandelar();
  bool _isLoading = false;

  _saveForm() async {
    _formKey.currentState.save();
    bool valid = _formKey.currentState.validate();

    if (valid) {
      setState(() {
        _isLoading = true;
      });
      try {
        await handelar.postAppointment(ClientAppointment(
          mobile: _mobile,
          name: _name,
          message: _message,
          dateTime: _dateTime,
        ));
        _showToast('Registration successful');
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }
  _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.black,
        fontSize: 16.0);
  }
  @override
  void dispose() {
    super.dispose();
    _nameFocus.dispose();
    _messageFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Appoinment", style: appBarTextStyle),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  FocusScope.of(context).requestFocus(_nameFocus);
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
                focusNode: _nameFocus,
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
                  FocusScope.of(context).requestFocus(_messageFocus);
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Birth Day",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              PopUpTextField(
                  title: _dateTime.toString(),
                  icon: Icons.arrow_drop_down_outlined,
                  function: () {
                    _selectDate(context);
                  }),
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
                focusNode: _messageFocus,
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
                  title: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                  onPress: () {
                    _saveForm();
                  }),
              SizedBox(
                height: _elementgap,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1970),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        _dateTime = DateFormat.yMMMd().format(currentDate).toString();
      });
  }
}
