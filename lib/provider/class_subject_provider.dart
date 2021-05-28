import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/model/subject.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/subject_provider.dart';

class ClassSubjectProvider with ChangeNotifier {
  List<ClassSubject> _classsubjects = [];

  List<ClassSubject> get classSubjects {
    return [..._classsubjects];
  }

  ClassSubject getClassSubjectById(String id) {
    return _classsubjects.firstWhere((element) => element.classSubjectId == id);
  }

  Future<https.Response> addClassSubject(
      Class _selectedClass, List<String> subjects) async {
    final resUrl = "http://192.168.0.20:8000/api/addclasssubject/";
    var url = Uri.parse(resUrl);
    https.Response classSubject;

    for (int i = 0; i < subjects.length; i++) {
      Map<String, String> classSubjectInfo = {
        'classes': _selectedClass.classId.toString(),
        'subject': subjects[i].toString(),
      };
      classSubject = await https.post(url, body: classSubjectInfo);
      print("classSubject from Class Subject Provider");
      print(classSubject);
    }
    return classSubject;
  }

  Future<https.Response> setFetchClassSubjectData() async {
    final url = "http://192.168.0.20:8000/api/viewclasssubject/";
    List<ClassSubject> classSubjectList = [];
    List<String> _className = [];
    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      // print(response.body);

      List classsubjects = json.decode(response.body);
      print(classsubjects);
      classsubjects.forEach((cs) {
        Class classs = new Class(
            classId: cs['classes']['id'].toString(),
            className: cs['classes']['className']);
        //var classId = cs['classes']['id'].toString();
        Subject subject = new Subject(
            subjectId: cs['subject']['id'].toString(),
            subjectName: cs['subject']['subjectName']);
        if (!_className.contains(classs.className)) {
          _className.add(classs.className);
          ClassSubject css = new ClassSubject(
              classSubjectId: cs['id'].toString(),
              classes: classs,
              subjects: []);
          css.subjects.add(subject);
          classSubjectList.add(css);
        } else {
          ClassSubject css = classSubjectList.firstWhere(
              (element) => element.classes.classId == classs.classId);
          css.subjects.add(subject);
        }
      });
      print(classSubjectList);
      _classsubjects = classSubjectList;
      notifyListeners();
      return null;
    } catch (error) {
      throw (error);
    }
  }
}
