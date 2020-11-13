import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum UserAuth { Login, SignUp }
enum Gender {Male, Female, Others}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 228, 176, 1.0).withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.4,
                width: double.infinity,
                color: Color.fromRGBO(239, 228, 176, 1),
                //color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Image.asset(
                    "assets/images/ECore1.png",
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
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

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  UserAuth _userAuth = UserAuth.Login;
  Gender _gender = Gender.Male;

  Map<String, String> _userAuthData = {
    'username': '',
    'gender': '',
    'email': '',
    'password': '',
  };

  var _isLoading = false;
  final _pwController = TextEditingController();
  AnimationController _controller;
  Animation<double> _slideAnimation;
  Animation<Offset> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _slideAnimation = Tween(begin: 5.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
    _opacityAnimation =
        Tween<Offset>(begin: Offset(0.0, 9.0), end: Offset(5.0, 3.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
    // validatation garya xaina bhane
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_userAuth == UserAuth.Login) {
        //login user
        // String userType = await Provider.of<Auth>(context, listen: false)
        //     .login(_userAuthData['email'], _userAuthData['password']);
        // if(userType.toString()=="client"){
        //   Navigator.of(context)
        //       .pushReplacementNamed(LibraryOverView.routeName);
        // }
      } else {
        //user sign up
//        print(_userAuthData);
//         String userType = await Provider.of<Auth>(context, listen: false)
//             .signUp(_userAuthData['email'], _userAuthData['password']);
//         print(userType);
//         if(userType.toString()=="client"){
//           Navigator.of(context)
//               .pushReplacementNamed(LibraryOverView.routeName);
//         }
      }
//    } on HttpException catch (error) {
//      var errorMessage = "Authenication failed";
//      if (error.toString().contains("EMAIL_EXITS")) {
//        errorMessage = 'This email address is already in use.';
//      } else if (error.toString().contains("INVALID_EMAIL")) {
//        errorMessage = 'This is not a valid email address.';
//      } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
//        errorMessage = 'Could not find a user with that email.';
//      } else if (error.toString().contains("INVALID_PASSWORD")) {
//        errorMessage = 'Invalid password.';
//      }
//      _showErrorDialog(errorMessage);
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

  // String get currentGenderSelected {
  //   switch (_gender) {
  //     case Gender.female:
  //       return "Female";
  //     case Gender.male:
  //       return "Male";
  //     default:
  //       return "Others";
  //   }
  // }

  void _switchAuthentication() {
    if (_userAuth == UserAuth.Login) {
      setState(() {
        _userAuth = UserAuth.SignUp;
      });
    } else {
      setState(() {
        _userAuth = UserAuth.Login;
      });
    }
    _controller.forward();
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
                _userAuth == UserAuth.SignUp
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            height: 54,
                            child: Material(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.grey[200],
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: "User Name",
                                  labelStyle: TextStyle(
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blueGrey,
                                  ),
                                  focusColor: Colors.red,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 20, right: 20),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'User Name should not be empty!';
                                  } else if (value.length < 4) {
                                    return 'User Name should have at least 5 characters!';
                                  }
                                },
                                onSaved: (value) {
                                  _userAuthData['username'] = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // SizedBox(
                          //   height: 54,
                          //   child: Material(
                          //     borderRadius: BorderRadius.circular(34),
                          //     color: Colors.grey[200],
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //         prefixIcon: Icon(
                          //           Icons.contact_phone,
                          //           color: Colors.blueGrey,
                          //         ),
                          //         labelText: "Gender",
                          //         labelStyle: TextStyle(
                          //           fontFamily: "font2",
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 22,
                          //           color: Colors.blueGrey,
                          //         ),
                          //         contentPadding:
                          //             EdgeInsets.only(bottom: 20, right: 20),
                          //         border: InputBorder.none,
                          //       ),
                          //       keyboardType: TextInputType.emailAddress,
                          //       validator: (value) {
                          //         // if (value.isEmpty) {
                          //         //   return 'Gender should not be empty!';
                          //         // } else if (value != "Male" ||
                          //         //     value != "Female") {
                          //         //   return 'Gender should be either male or female!';
                          //         // }
                          //       },
                          //       onSaved: (value) {
                          //         _userAuthData['gender'] = value;
                          //       },
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      )
                    : Container(
                        height: 2,
                      ),
                // _userAuth == UserAuth.ForgotPassword
                //     ? SizedBox(
                //         height: 54,
                //         child: Material(
                //           borderRadius: BorderRadius.circular(34),
                //           color: Colors.grey[200],
                //           child: TextFormField(
                //             decoration: InputDecoration(
                //               prefix: Icon(
                //                 Icons.mail,
                //                 color: Colors.blueGrey,
                //               ),
                //               labelText: "E-Mail",
                //               labelStyle: TextStyle(
                //                 fontFamily: "font2",
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 22,
                //                 color: Colors.blueGrey,
                //               ),
                //               focusColor: Colors.red,
                //               contentPadding:
                //                   EdgeInsets.only(bottom: 20, right: 20),
                //               border: InputBorder.none,
                //             ),
                //             keyboardType: TextInputType.emailAddress,
                //             validator: (value) {
                //               if (value.isEmpty) {
                //                 return 'E-Mail should not be empty!';
                //               } else if (!value.contains('@') &&
                //                   !value.contains('.com')) {
                //                 return 'Invalid E-Mail';
                //               }
                //             },
                //             onSaved: (value) {
                //               _userAuthData['email'] = value;
                //             },
                //           ),
                //         ),
                //       )
                //     : Container(
                //         height: 2,
                //       ),
                Column(
                        children: <Widget>[
                          SizedBox(
                            height: 54,
                            child: Material(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.grey[200],
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: "E-Mail",
                                  labelStyle: TextStyle(
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                  ),
                                  focusColor: Colors.red,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 20, right: 20),
                                  border: InputBorder.none,
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
                                  _userAuthData['email'] = value.trim();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 54,
                            child: Material(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.grey[200],
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(bottom: 20, right: 20),
                                  border: InputBorder.none,
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
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                _userAuth == UserAuth.SignUp
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  top: 7,
                                ),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 60,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: Gender.Male,
                                      groupValue: _gender,
                                      activeColor: Colors.blueGrey,
                                      onChanged: (value) => {},
                                    ),
                                    Text("Male"),
                                    Radio(
                                      value: Gender.Female,
                                      groupValue: _gender,
                                      activeColor: Colors.blueGrey,
                                      onChanged: (value) => {},
                                    ),
                                    Text("Female"),
                                    Radio(
                                      value: Gender.Others,
                                      groupValue: _gender,
                                      activeColor: Colors.blueGrey,
                                      onChanged: (value) => {},
                                    ),
                                    Text("Others"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(
                        height: 2,
                      ),
                // AnimatedContainer(
                //   constraints: BoxConstraints(
                //     minHeight: _userAuth == UserAuth.Login ? 6 : 10,
                //     maxHeight: _userAuth == UserAuth.Login ? 6 : 10,
                //   ),
                //   duration: Duration(milliseconds: 300),
                //   curve: Curves.bounceInOut,
                //   child: FadeTransition(
                //     opacity: _slideAnimation,
                //     child: SlideTransition(
                //       position: _opacityAnimation,
                //       child: TextFormField(
                //         enabled: _userAuth == UserAuth.Login,
                //         decoration:
                //         InputDecoration(labelText: 'Confirm Password'),
                //         obscureText: true,
                //         validator: _userAuth == UserAuth.Login
                //             ? (value) {
                //           if (value != _pwController.text) {
                //             return 'Passwords do not match!';
                //           }
                //         }
                //             : null,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 4,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  SizedBox(
                    height: 5,
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey,
                  ),
                  child: FlatButton(
                    child: Text(
                      _userAuth == UserAuth.SignUp
                          ? 'Sign Up'
                          : _userAuth == UserAuth.Login
                              ? 'Log In'
                              : 'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    onPressed: _submit,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _userAuth == UserAuth.Login
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Don't have an Account yet ? ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                    _userAuth == UserAuth.Login
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: _switchAuthentication,
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: _switchAuthentication,
                            ),
                          ),
                  ],
                ),
                _userAuth == UserAuth.Login
                    ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    ClipPath(
                      clipper: MovieTicketBothSidesClipper(),
                      child: Container(
                        color: Colors.blueGrey,
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
                )
                    : Container(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
