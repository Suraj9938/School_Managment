import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';

class UserClassProvider with ChangeNotifier {
  Future<https.Response> addUserClass(
      Auth _selectedUser, Class _selectedClass) async {
    final resUrl = "http://192.168.0.20:8000/api/adduserclass/";
    var url = Uri.parse(resUrl);
    https.Response userClass;

    Map<String, String> userClassInfo = {
      'user': _selectedUser.userId.toString(),
      'classes': _selectedClass.classId.toString(),
    };
    userClass = await https.post(url, body: userClassInfo);
    print("User Class from User Class Provider");
    print(userClassInfo);

    return userClass;
  }
}
