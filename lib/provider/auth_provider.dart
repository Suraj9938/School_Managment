import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/school.dart';
import 'package:school_management/provider/school_provider.dart';

class AuthProvider with ChangeNotifier {
  List<Auth> _users = [];

  Auth _loggedInUser;

  Auth get LoggedInUser {
    return _loggedInUser;
  }

  List<Auth> get users {
    return [..._users];
  }

  Future<https.Response> login(String email, String password) async {
    final url = "http://192.168.0.12:8000/api/login/";
    try {
      final response = await https.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      var res = json.decode(response.body)['user']; //code reusability
      final user = Auth(
        userId: res['id'].toString(),
        email: res['email'],
        name: res['name'],
        address: res['address'],
        age: res['age'],
        image: res['image'],
        mobileNo: res['mobileNo'],
        gender: res['gender'],
        isLibrarian: res['librarian'],
        isParent: res['parent'],
        isTeacher: res['teacher'],
        isStudent: res['student'],
        isAdmin: res['admin'],
      );
      _loggedInUser = user;
      notifyListeners();
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signup(BuildContext context, _userData,
      Uint8List images) async {
    final resUrl = "http://192.168.0.12:8000/api/create/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);
    School schoolInfo = Provider.of<SchoolProvider>(context, listen: false).schoolData;
    print("schoolInfo");
    final baseUrl = "http://192.168.0.12:8000/api/";

    request.files
        .add(https.MultipartFile.fromBytes('image', images, filename: 'a.jpg'));

    request.fields['name'] = _userData['name'];
    request.fields['address'] = _userData['address'];
    request.fields['gender'] = _userData['gender'];
    request.fields['age'] = _userData['age'];
    request.fields['mobileNo'] = _userData['mobileNo'];
    request.fields['email'] = _userData['email'];
    request.fields['password'] = _userData['password'];
    request.fields['teacher'] = _userData['isTeacher'].toString();
    request.fields['librarian'] = _userData['isLibrarian'].toString();
    request.fields['student'] = _userData['isStudent'].toString();
    request.fields['parent'] = _userData['isParent'].toString();

    print(request.fields['name']);
    print(request.fields['address']);
    print(request.fields['gender']);
    print(request.fields['age']);
    print(request.fields['mobileNo']);
    print(request.fields['email']);
    print(request.fields['password']);
    print(request.fields['teacher']);
    print(request.fields['librarian']);
    print(request.fields['student']);
    print(request.fields['parent']);

    https.Response response = await https.Response.fromStream(
      await request.send(),
    );

    var userRes = json.decode(response.body);
    print(userRes);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> schoolUserInfo = {
        'user': userRes['id'].toString(),
        'school': schoolInfo.schoolId,
      };
      print("school Id");
      print(schoolInfo.schoolId);
      var url = Uri.parse(baseUrl + 'userschool/');
      https.Response userSchool = await https.post(url, body: schoolUserInfo);
    }
  }
}
