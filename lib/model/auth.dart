import 'package:flutter/material.dart';

class Auth {
  String userId;
  String name;
  String address;
  String image;
  String gender;
  String age;
  String mobileNo;
  String email;
  bool isTeacher;
  bool isLibrarian;
  bool isStudent;
  bool isParent;
  bool isAdmin;

  Auth({
    @required this.userId,
    @required this.name,
    @required this.address,
    @required this.image,
    @required this.gender,
    @required this.age,
    @required this.mobileNo,
    @required this.email,
    @required this.isTeacher,
    @required this.isLibrarian,
    @required this.isParent,
    @required this.isStudent,
    @required this.isAdmin,
  });

}
