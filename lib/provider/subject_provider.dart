import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/subject.dart';

class SubjectProvider with ChangeNotifier {
  List<Subject> _subjects = [
  ];

  List<Subject> get subjects {
    return [..._subjects];
  }

  Future<https.Response> addSubject(_subject) async {
    final url = "http://192.168.0.20/api/addsubject/";
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
      print(response.body);
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<https.Response> setFetchSubjectData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewsubject/";
    var url = Uri.parse(resUrl);
    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);
      print(response.body.length);

      List<dynamic> subjects = List<dynamic>();
      subjects= json.decode(response.body);
      print("Subject from Subject Provider");
      print(subjects);
      _subjects.clear();
      for(int i=0; i<subjects.length; i++){
        final subjectData = Subject(
          subjectId: subjects[i]['id'].toString(),
          subjectName: subjects[i]['subjectName'],
        );
        print("Subject Info");
        print(subjects[i]['id'].toString());
        print(subjects[i]['subjectName']);
        _subjects.add(subjectData);
        print("_subjects");
        print(_subjects);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
