import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/assignment.dart';

class AssignmentProvider with ChangeNotifier {
  List<Assignment> _assignments = [];

  List<Assignment> get assignments {
    return [..._assignments];
  }

  Future<https.Response> addAssignment(_assignmentData, images) async {
    final resUrl = "http://192.168.0.20:8000/api/addassignment/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: "task.png"));

    request.fields['assignmentTask'] = _assignmentData['assignmentTask'];
    request.fields['deadline'] = _assignmentData['deadline'];

    await request.send();
  }

  Future<https.Response> setFetchedAssignmentData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewassignment/";
    var url = Uri.parse(resUrl);

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);

      List<dynamic> assignment = List<dynamic>();
      assignment = json.decode(response.body);
      print("Assignment from Assignment Provider:");
      print(assignment);
      print("assignment length");
      print(assignment.length);

      for (int i = 0; i < assignment.length; i++) {
        final assignmentInfo = Assignment(
          assignmentId: assignment[i]['id'].toString(),
          task: assignment[i]['assignmentTask'],
          image: assignment[i]['image'].toString(),
          deadline: assignment[i]['deadline'].toString(),
        );
        _assignments.add(assignmentInfo);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
