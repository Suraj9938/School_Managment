import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String userId;
  String name;
  String address;
  String image;
  String gender;
  String age;
  String mobileNo;
  String email;
  String password;
  bool isTeacher;
  bool isLibrarian;
  bool isStudent;
  bool isParent;
  bool isAdmin;
  bool isStaff;

  Auth({
    this.userId,
    this.name,
    this.address,
    this.image,
    this.gender,
    this.age,
    this.mobileNo,
    this.email,
    this.password,
    this.isTeacher,
    this.isLibrarian,
    this.isParent,
    this.isStudent,
    this.isAdmin,
    this.isStaff,
  });
}
