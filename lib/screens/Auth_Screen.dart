import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';

enum UserAuth { Login, ProceedToSignUp, SignUp }
enum Gender { Male, Female, Others }

//String authprovider = await Provider.of<Auth>(context, listen: false);
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

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  UserAuth _userAuth = UserAuth.Login;
  Gender _gender = Gender.Male;

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
        await Provider.of<Auth>(context, listen: false)
            .login(_userAuthData['email'], _userAuthData['password']);
        Navigator.of(context)
            .pushReplacementNamed(PrincipalOverViewScreen.routeName);
        //login user
        // String userType = await Provider.of<Auth>(context, listen: false)
        //     .login(_userAuthData['email'], _userAuthData['password']);
        // if(userType.toString()=="client"){
        //   Navigator.of(context)
        //       .pushReplacementNamed(LibraryOverView.routeName);
        // }
      } else if (_userAuth == UserAuth.ProceedToSignUp) {
        setState(() {
          _userAuth = UserAuth.SignUp;
        });
      } else if (_userAuth == UserAuth.SignUp) {
        //user sign up
        await Provider.of<Auth>(context, listen: false).signup(
          _userAuthData['name'],
          _userAuthData['mobileNo'],
          _userAuthData['gender'],
          _userAuthData['image'],
          _userAuthData['address'],
          _userAuthData['age'],
          _userAuthData['email'],
          _userAuthData['password'],
        );
        Navigator.of(context)
            .pushReplacementNamed(PrincipalOverViewScreen.routeName);
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

  void _switchAuthentication() {
    if (_userAuth == UserAuth.Login) {
      setState(() {
        _userAuth = UserAuth.ProceedToSignUp;
      });
    } else if (_userAuth == UserAuth.ProceedToSignUp) {
      setState(() {
        _userAuth = UserAuth.Login;
      });
    } else if (_userAuth == UserAuth.SignUp) {
      setState(() {
        _userAuth = UserAuth.ProceedToSignUp;
      });
    }
    _controller.forward();
  }

  File imagePath;
  ImagePicker _selectedImage = ImagePicker();

  Future<void> _getImage(ImageSource image) async {
    try {
      imagePath = File((await _selectedImage.getImage(source: image)).path);
      setState(() {
        if (imagePath != null) {
          imagePath = File(imagePath.path);
        } else {
          print('No Image Selected!');
        }
      });
    } catch (error) {
      throw error;
    }
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
                _userAuth == UserAuth.ProceedToSignUp
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            height: 34,
                          ),
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
                        ],
                      )
                    : Container(
                        height: 12,
                      ),
                _userAuth == UserAuth.ProceedToSignUp
                    ? SizedBox(
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
                              labelText: "Mobile Number",
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
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Mobile Number should not be empty!';
                              } else if (value.length != 10) {
                                return 'Mobile Number should be exactly 10 characters!';
                              }
                            },
                            onSaved: (value) {
                              _userAuthData['mobileNo'] = value;
                            },
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                _userAuth == UserAuth.SignUp
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Container(
                                  height: 132,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      60,
                                  color: Colors.blueGrey[200],
                                  child: RaisedButton(
                                    child: imagePath == null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Choose an Image",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "font2",
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          )
                                        : Image.file(
                                            imagePath,
                                            fit: BoxFit.contain,
                                      width: double.infinity,
                                      height: double.infinity,
                                          ),
                                    onPressed: () {
                                      _getImage(ImageSource.gallery);
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 56,
                                    width:
                                        MediaQuery.of(context).size.width / 2 +
                                            10,
                                    padding: EdgeInsets.only(left: 13),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(26),
                                      color: Colors.grey[200],
                                      child: TextFormField(
                                        //initialValue: initValues['bookType'],
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.location_on_sharp,
                                              color: Colors.blueGrey,
                                            ),
                                            labelText: "Address",
                                            labelStyle: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "font2",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Address should not be empty!';
                                          }
                                        },
                                        onSaved: (value) {
                                          _userAuthData['address'] =
                                              value.trim();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 56,
                                    width:
                                        MediaQuery.of(context).size.width / 2 +
                                            10,
                                    padding: EdgeInsets.only(left: 13),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(26),
                                      color: Colors.grey[200],
                                      child: TextFormField(
                                        //initialValue: initValues['bookType'],
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.blueGrey,
                                          ),
                                          labelText: "Age",
                                          labelStyle: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "font2",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Age should not be empty!';
                                          } else if (value.length > 3) {
                                            return 'Please Input Valid Age and Try Again!';
                                          }
                                        },
                                        onSaved: (value) {
                                          _userAuthData['age'] = value.trim();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      )
                    : Container(),
                _userAuth != UserAuth.ProceedToSignUp
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
                            height: 16,
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
                      )
                    : Container(),
                _userAuth == UserAuth.ProceedToSignUp
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
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _userAuth == UserAuth.Login ? 6 : 10,
                    maxHeight: _userAuth == UserAuth.Login ? 6 : 10,
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  child: FadeTransition(
                    opacity: _slideAnimation,
                    child: SlideTransition(
                      position: _opacityAnimation,
                      child: TextFormField(
                        enabled: _userAuth == UserAuth.Login,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: _userAuth == UserAuth.Login
                            ? (value) {
                                if (value != _pwController.text) {
                                  return 'Passwords do not match!';
                                }
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
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
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey,
                  ),
                  child: FlatButton(
                    child: Text(
                      _userAuth == UserAuth.ProceedToSignUp
                          ? 'Proceed to Sign Up'
                          : _userAuth == UserAuth.Login
                              ? 'Log In'
                              : 'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    onPressed: _submit,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _userAuth == UserAuth.Login
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Don't have an account yet ? ",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : _userAuth == UserAuth.ProceedToSignUp
                            ? Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Already have an account ? ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : _userAuth == UserAuth.SignUp
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Go Back ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 2,
                                  ),
                    _userAuth == UserAuth.Login
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: _switchAuthentication,
                            ),
                          )
                        : _userAuth == UserAuth.ProceedToSignUp
                            ? Padding(
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
                              )
                            : _userAuth == UserAuth.SignUp
                                ? Padding(
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
                                  )
                                : Container(
                                    height: 2,
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
