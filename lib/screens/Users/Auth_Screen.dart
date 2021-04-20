import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:school_management/screens/Librarian/Librarian_OverView_Screen.dart';
import 'package:school_management/screens/Parent/Parent_OverView_Screen.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/screens/Teacher/Teacher_OverViewScreen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "/auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.4,
                width: double.infinity,
                color: Color.fromRGBO(255, 128, 64, 1),
                child: Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Image.asset(
                    "assets/images/ECore.png",
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.45,
              child: Column(
                children: [
                  Flexible(
                    child: AuthCard(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  Map<String, String> _userAuthData = {
    'name': '',
    'mobileNo': '',
    'gender': '',
    'image': '',
    'address': '',
    'age': '',
    'email': '',
    'password': '',
  };

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.orange,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }

  var _isLoading = false;
  final _pwController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(errorMessage),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    // if no validation
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .login(_userAuthData['email'], _userAuthData['password']);
      if (response.statusCode == 200) {
        Auth user =
            Provider.of<AuthProvider>(context, listen: false).LoggedInUser;
        if (user.isAdmin) {
          Navigator.of(context)
              .pushReplacementNamed(PrincipalOverViewScreen.routeName);
          print("Admin");
        } else if (user.isStudent) {
          Navigator.of(context)
              .pushReplacementNamed(StudentOverViewScreen.routeName);
          print("Student");
        } else if (user.isLibrarian) {
          Navigator.of(context)
              .pushReplacementNamed(LibrarianOverViewScreen.routeName);
          print("Librarian");
        } else if (user.isTeacher) {
          Navigator.of(context)
              .pushReplacementNamed(TeacherOverviewScreen.routeName);
          print("Teacher");
        } else if (user.isParent) {
          Navigator.of(context)
              .pushReplacementNamed(ParentOverViewScreen.routeName);
          print("Parent");
        }
      } else if (response.statusCode >= 300 && response.statusCode < 400 ||
          response.statusCode == 500) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occurred!'),
                  content: Text("Something is wrong"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occurred!'),
                  content: Text("Provided Credentials does not match"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      }
    } catch (error) {
      print(error);
      const errorMessage =
          "Could not authenticate you. Please try again later!";
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Form(
        key: _globalKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 18,
                ),
                Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.orange,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: "E-Mail",
                        labelStyle: TextStyle(
                          fontFamily: "font2",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        border: _outlineBorder(),
                        enabledBorder: _outlineBorder(),
                        errorBorder: _outlineBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'E-Mail should not be empty!';
                        } else if (!value.contains('@') &&
                            !value.contains('.com')) {
                          return 'Invalid E-Mail';
                        }
                      },
                      onSaved: (value) {
                        _userAuthData['email'] = value;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.orange,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontFamily: "font2",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        border: _outlineBorder(),
                        enabledBorder: _outlineBorder(),
                        errorBorder: _outlineBorder(),
                      ),
                      obscureText: true,
                      controller: _pwController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password should not be empty!';
                        } else if (value.length < 4) {
                          return 'Password should be at least 5 characters!';
                        }
                      },
                      onSaved: (value) {
                        _userAuthData['password'] = value;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.orange,
                    ),
                    child: FlatButton(
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      onPressed: _submit,
                    ),
                  ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: <Widget>[
                    ClipPath(
                      clipper: MovieTicketBothSidesClipper(),
                      child: Container(
                        color: Colors.orange,
                        height: 53,
                        width: 230,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "WELCOME",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.solidSmile,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
