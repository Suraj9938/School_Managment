import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/school.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:http/http.dart' as https;

enum Gender { Male, Female, Others }
enum UserType { Parent, Student, Teacher, Librarian }

class AddUserScreen extends StatefulWidget {
  static const routeName = 'AddUser';

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _userAge = FocusNode();
  final _userAddress = FocusNode();
  final _userEmail = FocusNode();
  final _userPassword = FocusNode();
  final _userReEnterPassword = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  Uint8List images;

  var _userData = {};

  Gender _gender = Gender.Male;
  UserType userType = UserType.Teacher;

  String get currentGender {
    switch (_gender) {
      case Gender.Male:
        return "Male";
      case Gender.Female:
        return "Female";
      default:
        return "Others";
    }
  }

  void _selectedGender(Gender value) {
    setState(() {
      _gender = value;
      var gender = _gender;
      _userData['gender'] = gender == Gender.Male
          ? "Male"
          : gender == Gender.Female
              ? "Female"
              : "Others";
    });
  }

  String get currentUserType {
    switch (userType) {
      case UserType.Parent:
        return "Parent";
      case UserType.Student:
        return "Student";
      case UserType.Teacher:
        return "Teacher";
      case UserType.Librarian:
        return "Librarian";
    }
  }

  String _userTypeInString(UserType chosenUserType) {
    return chosenUserType == UserType.Librarian
        ? "Librarian"
        : chosenUserType == UserType.Parent
            ? "Parent"
            : chosenUserType == UserType.Student
                ? "Student"
                : chosenUserType == UserType.Teacher
                    ? "Teacher"
                    : null;
  }

  void _selectedUserType(UserType value) {
    setState(() {
      userType = value;
      var user = userType;
      print(user);

      if (user == UserType.Librarian) {
        setState(() {
          _userData['isLibrarian'] = true;
          _userData['isTeacher'] = false;
          _userData['isStudent'] = false;
          _userData['isParent'] = false;
        });
      } else if (user == UserType.Teacher) {
        setState(() {
          _userData['isTeacher'] = true;
          _userData['isLibrarian'] = false;
          _userData['isStudent'] = false;
          _userData['isParent'] = false;
        });
      } else if (user == UserType.Student) {
        setState(() {
          _userData['isStudent'] = true;
          _userData['isTeacher'] = false;
          _userData['isLibrarian'] = false;
          _userData['isParent'] = false;
        });
      } else if (user == UserType.Parent) {
        setState(() {
          _userData['isParent'] = true;
          _userData['isStudent'] = false;
          _userData['isTeacher'] = false;
          _userData['isLibrarian'] = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userAge.dispose();
    _userAddress.dispose();
    _userEmail.dispose();
    _userPassword.dispose();
    _userReEnterPassword.dispose();
  }

  File userImage;
  ImagePicker _selectedImage = ImagePicker();

  Future<void> _getImage(ImageSource image) async {
    try {
      final imagePath =
          await _selectedImage.getImage(source: ImageSource.gallery);
      if (imagePath != null) {
        var imageBytes = await imagePath.readAsBytes();
        setState(() {
          userImage = File(imagePath.path);
          images = imageBytes;
        });
      } else {
        print('No Image Selected!');
      }
    } catch (error) {
      throw error;
    }
  }

  //save form and validate
  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .signup(context, _userData, images);
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Success'),
                content: Text("User was registered successfully"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ));
    } catch (error) {
      print(error);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.white,
            onPressed: () => _saveForm(),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, bottom: 18),
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        fontFamily: "font2",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width / 2 + 15,
                                padding: EdgeInsets.only(left: 13),
                                child: Material(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey[300],
                                  child: TextFormField(
                                    //initialValue: initValues['bookType'],
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person_pin,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        labelText: "User Name",
                                        labelStyle: TextStyle(
                                            fontSize: 19,
                                            fontFamily: "font2",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.orange),
                                        border: InputBorder.none),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(_userAddress);
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'User Name must not be empty';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) =>
                                        _userData['name'] = value,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width / 2 + 15,
                                padding: EdgeInsets.only(left: 13),
                                child: Material(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey[300],
                                  child: TextFormField(
                                    //initialValue: initValues['bookType'],
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        labelText: "User Address",
                                        labelStyle: TextStyle(
                                            fontSize: 19,
                                            fontFamily: "font2",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.orange),
                                        border: InputBorder.none),
                                    textInputAction: TextInputAction.done,
                                    focusNode: _userAddress,
                                    // onFieldSubmitted: (_) {
                                    //   FocusScope.of(context).requestFocus(_categoryId);
                                    // },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'User Address must not be empty';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) =>
                                        _userData['address'] = value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              height: 132,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              color: Colors.blueGrey[200],
                              child: RaisedButton(
                                child: images == null && userImage == null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera,
                                            color: Colors.orange,
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
                                              color: Colors.orange,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )
                                    : Image.file(
                                        userImage,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                      ),
                                onPressed: () {
                                  _getImage(ImageSource.gallery);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 28,
                        child: Row(
                          children: [
                            Icon(
                              Icons.wc_outlined,
                              color: Colors.orange,
                              size: 22,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "User Gender",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 4,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width - 60,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: Gender.Male,
                                          groupValue: _gender,
                                          activeColor: Colors.orange,
                                          onChanged: (value) =>
                                              _selectedGender(value),
                                        ),
                                        Text("Male"),
                                        Radio(
                                          value: Gender.Female,
                                          groupValue: _gender,
                                          activeColor: Colors.orange,
                                          onChanged: (value) =>
                                              _selectedGender(value),
                                        ),
                                        Text("Female"),
                                        Radio(
                                          value: Gender.Others,
                                          groupValue: _gender,
                                          activeColor: Colors.orange,
                                          onChanged: (value) =>
                                              _selectedGender(value),
                                        ),
                                        Text("Others"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.supervised_user_circle_outlined,
                              color: Colors.orange,
                              size: 22,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Select User Type",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Material(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.grey[300],
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: DropdownButton<UserType>(
                                    value: userType,
                                    items: UserType.values
                                        .map((UserType userType) {
                                      return DropdownMenuItem<UserType>(
                                        value: userType,
                                        child: Text(
                                          _userTypeInString(userType),
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) =>
                                        _selectedUserType(value),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 - 35,
                            padding: EdgeInsets.only(left: 13),
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[300],
                              child: TextFormField(
                                //initialValue: initValues['bookType'],
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    labelText: "User Age",
                                    labelStyle: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "font2",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange),
                                    border: InputBorder.none),
                                textInputAction: TextInputAction.next,
                                focusNode: _userAge,
                                keyboardType: TextInputType.phone,
                                onChanged: (value) => _userData['age'] = value,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 + 26,
                            padding: EdgeInsets.only(left: 13),
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[300],
                              child: TextFormField(
                                //initialValue: initValues['bookType'],
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mobile_friendly,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    labelText: "Mobile Number",
                                    labelStyle: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "font2",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange),
                                    border: InputBorder.none),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_userEmail);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mobile Number must not be empty';
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    _userData['mobileNo'] = value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, bottom: 18),
                    child: Text(
                      "User Mailing Address",
                      style: TextStyle(
                        fontFamily: "font2",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 70,
                          padding: EdgeInsets.only(left: 13),
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: TextFormField(
                              //initialValue: initValues['bookType'],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.quick_contacts_mail,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  labelText: "User Email",
                                  labelStyle: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "font2",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange),
                                  border: InputBorder.none),
                              focusNode: _userEmail,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_userPassword);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'User Email must not be empty';
                                }
                                return null;
                              },
                              onChanged: (value) => _userData['email'] = value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 70,
                          padding: EdgeInsets.only(left: 13),
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: TextFormField(
                              //initialValue: initValues['bookType'],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.verified_user_rounded,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "font2",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange),
                                  border: InputBorder.none),
                              textInputAction: TextInputAction.done,
                              focusNode: _userPassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password must not be empty';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  _userData['password'] = value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
