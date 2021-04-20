import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/subject.dart';

class SubjectProvider with ChangeNotifier {
  var subject = List<Subject>();
  List<Subject> _subjects = [
  ];

  List<Subject> get subjects {
    return [..._subjects];
  }

  Future<https.Response> addSubject(_subject) async {
    final url = "http://192.168.0.19/api/addsubject/";
    try {
      final https.Response response = await https.post(
        url,
        body: json.encode(
          {
            'subjectName': _subject['subjectName'],
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      // var subjectRes = json.decode(response.body);
      // print("Subject Response Structure");
      // print(subjectRes);
      // final subject = Subject(
      //   subjectId: subjectRes['id'].toString(),
      //   subjectName: subjectRes['subjectName'],
      // );
      // _subject = subject;
      print(response.body);
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<https.Response> setFetchSubjectData() async {
    final resUrl = "http://192.168.0.19:8000/api/viewsubject/";
    var url = Uri.parse(resUrl);
    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);
      print(response.body.length);

      var subjectRes = json.decode(response.body);
      for(int i=0; i<subjectRes.length; i++){
        final subjectData = Subject(
          subjectId: subjectRes[i]['id'],
          subjectName: subjectRes[i]['subjectName'],
        );
        print(subjectRes[i]['id']);
        print(subjectRes[i]['subjectName']);
        subject.add(subjectData);
      }
      _subjects = subject;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
