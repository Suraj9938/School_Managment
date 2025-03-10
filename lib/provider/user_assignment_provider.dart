import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_management/model/assignment.dart';
import 'package:school_management/model/auth.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/class.dart';
import 'package:school_management/model/subject.dart';

class UserAssignmentProvider with ChangeNotifier {
  List<UserAssignment> _userAssignments = [];

  List<UserAssignment> get userAssignments {
    return [..._userAssignments];
  }

  Future<void> setFetchUserAssignment(Auth user) async {
    String baseUrl = 'http://192.168.0.20:8000/api/';
    final classURL = Uri.parse(baseUrl + "viewuserclass/");
    final assignmentURL = Uri.parse(baseUrl + "viewclasssubjectassignment/");
    Class classs = new Class();

    List<UserAssignment> uAssign = [];
    try {
      final classResponse = await https.get(classURL);
      final assignmentResponse = await https.get(assignmentURL);

      List userClass = json.decode(classResponse.body);
      userClass.forEach((element) {
        if (element['user']['id'].toString() == user.userId) {
          classs.classId = element['classes']['id'].toString();
          classs.className = element['classes']['className'];
        }
      });

      List assignments = json.decode(assignmentResponse.body);
      assignments.forEach((a) {
        Assignment assignment = new Assignment();
        Subject subject = new Subject();
        if (a['classes']['id'].toString() == classs.classId) {
          print(a['assignments']['assignmentTask'].toString());
          assignment.assignmentId = a['assignments']['id'].toString();
          assignment.task = a['assignments']['assignmentTask'].toString();
          assignment.image = a['assignments']['image'];
          assignment.deadline = a['assignments']['deadline'];

          subject.subjectId = a['subjects']['id'].toString();
          subject.subjectName = a['subjects']['subjectName'];

          // print("subject.subjectId");
          // print(classs.classId);
          // print(subject.subjectId);
          // print(assignment.assignmentId);
          uAssign.add(
            new UserAssignment(
              user: user,
              classs: classs,
              subject: subject,
              assignment: assignment,
            ),
          );
        }
      });
      _userAssignments = uAssign;
      // for (int i = 0; i < uAssign.length; i++) {
      //   print("U Assign Info");
      //   print(uAssign[i].classs.className);
      //   print(uAssign[i].subject.subjectName);
      //   print(uAssign[i].assignment.task);
      // }
      notifyListeners();
    } catch (e) {
      return null;
    }
  }
}
