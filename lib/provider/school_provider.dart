import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:school_management/model/school.dart';
import 'package:http/http.dart' as https;

class SchoolProvider with ChangeNotifier {
  List<School> _schools = [
  ];

  List<School> get schools {
    return [..._schools];
  }

  Future<void> addSchool(School school) async {
    final url = "http://192.168.137.1:8000/api/addschool/";
    try {
      final response = await https.post(
        url,
        body: json.encode({
          'name': school.schoolName,
          'location': school.location,
          'image': school.schoolImage,
          'description' : school.schoolDescription,
          'contact' : school.schoolContact,
          'startTime' : school.startTime,
          'endTime' : school.endTime,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
    }
    catch (error) {
      throw error;
    }
  }
}
