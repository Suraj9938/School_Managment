import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';

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
    final url = "http://192.168.0.8:8000/api/login/";
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
        image: res['image'].toString(),
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

  Future<https.Response> signup(String username, String mobileNo, String gender, String image, String address, String age, String email, String password) async {
    final url = "http://192.168.0.8:8000/api/create/";
    try {
      final response = await https.post(
        url,
        body: json.encode({
          'name': username.trim(),
          'mobileNo' : mobileNo,
          'gender' : gender,
          'image' : image,
          'address' : address,
          'age' : age,
          'email': email.trim(),
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
    } catch (error) {
      throw (error);
    }
  }
}
