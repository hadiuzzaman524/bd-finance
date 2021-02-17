import 'package:bd_finance/constants/constants.dart';
import 'package:bd_finance/generated/assets.dart';
import 'package:bd_finance/screens/sales_force.dart';
import 'package:bd_finance/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  static const routeName = "/Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";
  String _name = "";
  final _formKey = GlobalKey<FormState>();
  final _singUpFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _errorMsg = '';

  final double _height = 8;
  final double _elementgap = 15;
  final _passwordFocus = FocusNode();
  bool isLoading = false;

  UserCredential state;
  final auth = FirebaseAuth.instance;

  _saveLogInForm() async {
    _formKey.currentState.save();
    bool valid = _formKey.currentState.validate();

    if (valid) {
      setState(() {
        isLoading = true;
      });
      print("Wait...");
      state = await auth
          .signInWithEmailAndPassword(email: _email, password: _password)
          .catchError((e) {
        _errorMsg = e.toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_errorMsg.split(". ").last)));
        setState(() {
          isLoading = false;
        });
      });
      print("Done");
    }
  }

  _saveSignUpForm() async {
    _singUpFormKey.currentState.save();
    bool valid = _singUpFormKey.currentState.validate();

    if (valid) {
      setState(() {
        isLoading = true;
      });
      print('Waiting....');
      Navigator.pop(context);
      try {
        state = await auth
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .catchError((e) {
          _errorMsg = e.toString();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(_errorMsg.split(". ").last)));
          setState(() {
            isLoading = false;
          });
        });
        print("Done");
      } catch (e) {
        print(e);
      }

      await FirebaseFirestore.instance.collection('users').doc().set({
        'name': _name,
        'email': _email,
        'userId': state.user.uid
      }).catchError((e) {
        print("Error: $e");
      });
    }
  }

  _showAlertDialog() {
    Alert(
        context: context,
        title: "Create an account",
        content: Form(
          key: _singUpFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter your name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter your email";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter password";
                  } else if (value.length < 6) {
                    return "Enter at last 6 characters";
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            color: Theme.of(context).buttonColor,
            onPressed: _saveSignUpForm,
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage:
                              AssetImage('assets/images/f120x120.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Text(
                        "Email",
                        style: labelStyle,
                      ),
                      SizedBox(
                        height: _height,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'e.g:hadiuzzaman@gmail.com ',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                      ),
                      SizedBox(
                        height: _elementgap,
                      ),
                      Text(
                        "Password",
                        style: labelStyle,
                      ),
                      SizedBox(
                        height: _height,
                      ),
                      TextFormField(
                        obscureText: true,
                        focusNode: _passwordFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '*****',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter password.";
                          } else if (value.length < 6) {
                            return "Password must be 6 character long";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(
                        height: _elementgap,
                      ),
                      CommonButton(
                        title: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                        onPress: _saveLogInForm,
                      ),
                      SizedBox(
                        height: _elementgap,
                      ),
                      InkWell(
                        onTap: _showAlertDialog,
                        child: Text(
                          "Create Account",
                          textAlign: TextAlign.right,
                          style: titleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
