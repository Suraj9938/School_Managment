import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class Auth with ChangeNotifier {
  Future<Response> login(String email, String password) async {
    final url = "http://192.168.137.1:8000/api/login/";
    try {
      final response = await https.post(
        url,
        body: json.encode({
          'email': email.trim(),
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      // print(response.statusCode);
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> signup(String username, String mobileNo, String gender, String image, String address, String age, String email, String password) async {
    final url = "http://192.168.137.1:8000/api/create/";
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
