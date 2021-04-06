import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/school.dart';
import 'package:http/http.dart' as https;

class SchoolProvider with ChangeNotifier {
  School _schools;

  School get schoolData {
    return _schools;
  }

  Future<void> setFetchSchoolData() async {
    final resUrl = "http://192.168.0.12:8000/api/viewschool/";
    var url = Uri.parse(resUrl);
    try {
      final response = await https.get(
        url,
      );
      print("Set Fetch Response");
      print(response.body);

      var schoolRes = json.decode(response.body);
      final schoolData = School(
          schoolId: schoolRes[0]['id'].toString(),
          schoolName: schoolRes[0]['name'],
          location: schoolRes[0]['location'],
          schoolImage: schoolRes[0]['image'],
          schoolDescription: schoolRes[0]['description'],
          schoolContact: schoolRes[0]['contact'].toString(),
          startTime: schoolRes[0]['startTime'],
          endTime: schoolRes[0]['endTime'],
      );
      _schools = schoolData;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  // Future<https.Response> addSchool(_schoolData, images) async {
  //   final resUrl = "http://192.168.0.12:8000/api/addschool/";
  //   var url = Uri.parse(resUrl);
  //   var request = https.MultipartRequest('POST', url);
  //
  //   request.files.add(
  //       https.MultipartFile.fromBytes('image', images, filename: 'school.jpg'));
  //
  //   request.fields['name'] = _schoolData['name'];
  //   request.fields['location'] = _schoolData['location'];
  //   request.fields['description'] = _schoolData['description'];
  //   request.fields['contact'] = _schoolData['contact'];
  //   request.fields['startTime'] = _schoolData['startTime'];
  //   request.fields['endTime'] = _schoolData['endTime'];
  //
  //   var res = await request.send();
  // }
}
