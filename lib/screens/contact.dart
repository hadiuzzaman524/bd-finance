import 'dart:io';

import 'package:bd_finance/models/customer_details.dart';
import 'package:bd_finance/models/data_handelar.dart';
import 'package:bd_finance/widgets/button.dart';
import 'package:bd_finance/widgets/textfieldwithdropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

import '../widgets/bottom_navigation.dart';

class Contact extends StatefulWidget {
  static const routeName = "/Contacts";

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final double _height = 8;
  final double _elementgap = 15;
  final _mobileFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _approximateFocus = FocusNode();
  DateTime currentDate = DateTime.now();
  bool _checkedValue = false;

  File _image;
  String _imagePath = "";
  final picker = ImagePicker();

  String _name = "";
  String _mobile = "";
  String _address = "";
  String _approximate = "";
  String _profession = "";
  String _dateTime = DateFormat.yMMMd().format(DateTime.now()).toString();
  String _imageUrl = "";
  bool _makeDeposit = false;

  final handler = DataHandelar();
  bool _isLoading = false;

  String _professionHint = "Choose your profession";

  _saveForm() async {
    _formKey.currentState.save();
    bool valid = _formKey.currentState.validate();

    if (valid) {
      setState(() {
        _isLoading = true;
      });
      if (_image == null) {
        _showToast("Please picked an image");
      } else if (_profession.isEmpty) {
        _showToast("Select your profession");
      } else {
        try {
          await handler.postLoanAndDeposit(CustomerDetails(
            name: _name,
            mobile: _mobile,
            address: _address,
            profession: _profession,
            approximate: _approximate,
            birthday: _dateTime,
            makeDeposite: _makeDeposit,
            file: _image,
          ));
        } catch (e) {
          print(e);
        }
        _showToast("Registration Successful");
        setState(() {
          _isLoading = false;
        });
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
    _mobileFocus.dispose();
    _addressFocus.dispose();
    _approximateFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer Details",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
                  hintText: 'Event name here ',
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
                    return "Please enter event name";
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
                  hintText: 'Mobile',
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
                "Address",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                maxLines: 3,
                focusNode: _addressFocus,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter address";
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_approximateFocus);
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Profession",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              PopUpTextField(
                  title: _profession,
                  icon: Icons.arrow_drop_down_outlined,
                  function: () async {
                    await showPopupMenuProfessions();
                  }),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Approximate Net worth",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                focusNode: _approximateFocus,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter amount";
                  }
                  return null;
                },
                onSaved: (value) {
                  _approximate = value;
                },
              ),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "BirthDay",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              PopUpTextField(
                  title: _dateTime,
                  icon: Icons.arrow_drop_down_outlined,
                  function: () {
                    _selectDate(context);
                  }),
              SizedBox(
                height: _elementgap,
              ),
              Text(
                "Add image",
                style: labelStyle,
              ),
              SizedBox(
                height: _height,
              ),
              PopUpTextField(
                  title: _imagePath,
                  icon: Icons.attach_file,
                  function: () async {
                    await getImage();
                  }),
              Container(
                child: Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.black,
                        value: _checkedValue,
                        onChanged: (value) {
                          setState(() {
                            _checkedValue = value;
                          });
                        }),
                    Text(
                      "Make Deposit",
                      style: labelStyle,
                    ),
                  ],
                ),
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
                          'Create Visit',
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

  showPopupMenuProfessions() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(child: const Text('Doctor'), value: 'Doctor'),
        PopupMenuItem<String>(child: const Text('Engineer'), value: 'Engineer'),
        PopupMenuItem<String>(child: const Text('Teacher'), value: 'Teacher'),
        PopupMenuItem<String>(child: const Text('Police'), value: 'Police'),
        PopupMenuItem<String>(child: const Text('Student'), value: 'Student'),
        PopupMenuItem<String>(child: const Text('Others'), value: 'Others'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "Doctor") {
        setState(() {
          _profession = "Doctor";
        });
        //code here
      } else if (itemSelected == "Engineer") {
        //code here
        setState(() {
          _profession = "Engineer";
        });
      } else if (itemSelected == "Teacher") {
        //code here
        setState(() {
          _profession = "Teacher";
        });
      } else if (itemSelected == "Police") {
        //code here
        setState(() {
          _profession = "Police";
        });
      } else if (itemSelected == "Student") {
        //code here
        setState(() {
          _profession = "Student";
        });
      } else {
        setState(() {
          _profession = "Others";
        });
      }
    });
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

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery).catchError((e) {
      print("error");
    });

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagePath = pickedFile.path.split('/').last.toString();
        //file.path.split('/').last;
      } else {
        print('No image selected.');
      }
    });
  }
}
