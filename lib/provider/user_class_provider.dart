import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/model/user_class.dart';

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

  Future<https.Response> getUserClassData() async {
    final url = "http://192.168.0.20:8000/api/viewuserclass/";
    List<UserClass> userClassList = [];
    List<String> _classes = [];

    try {
      final response = await https.get(
        url,
      );

      List userClass = json.decode(response.body);
      userClass.forEach((us) {
        Class classs = new Class(
            classId: us['classes']['id'].toString(),
            className: us['classes']['className']);
        Auth user = new Auth(
          userId: us['user']['id'].toString(),
          name: us['user']['name'],
        );
        if (!_classes.contains(classs.className)) {
          _classes.add(classs.className);
          UserClass uss = new UserClass(
            userClassId: us['id'].toString(),
            classes: classs,
            users: [],
          );
          uss.users.add(user);
          userClassList.add(uss);
        } else {
          UserClass uss = userClassList.firstWhere(
              (element) => element.classes.classId == classs.classId);
          uss.users.add(user);
        }
      });
    } catch (error) {
      throw error;
    }
  }
}
