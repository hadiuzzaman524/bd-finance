import 'package:bd_finance/widgets/button.dart';
import 'package:bd_finance/widgets/textfieldwithdropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  String _name = "";
  String _mobile = "";
  String _address = "";
  String _approximate = "";
  String _profession = "";
  DateTime _dateTime = DateTime.now();
  String _imageUrl = "";
  bool _makeDeposit = false;

  String _professionHint = "Choose your profession";

  _saveForm() {
    _formKey.currentState.save();
    bool valid = _formKey.currentState.validate();

    if (valid) {
      print(_name);
      print(_address);
      print(_approximate);
      print(_mobile);
    }
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
        padding: EdgeInsets.all(20),
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
                  function: () {
                    showPopupMenuProfessions();
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
                  title: 'Birth Day',
                  icon: Icons.arrow_drop_down_outlined,
                  function: () {
                    showPopupMenuProfessions();
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
                  title: 'hadi.jpg',
                  icon: Icons.attach_file,
                  function: () {
                    showPopupMenuProfessions();
                  }),
              SizedBox(
                height: _elementgap,
              ),
              CommonButton(
                  title: "Create Visit",
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
}

class PopUpTextField extends StatelessWidget {
  final String title;
  final Function function;
  final IconData icon;

  PopUpTextField({
    @required this.title,
    @required this.function,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: InkWell(
                  onTap: function,
                  child: Icon(icon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
