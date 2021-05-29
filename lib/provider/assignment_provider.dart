import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/assignment.dart';

class AssignmentProvider with ChangeNotifier {
  List<Assignment> _assignments = [];

  List<Assignment> get assignments {
    return [..._assignments];
  }

  Future<https.Response> addAssignment(
      _assignmentData, images, _classId, _subjectId) async {
    final resUrl = "http://192.168.0.20:8000/api/addassignment/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);
    https.Response response;
    final baseUrl = "http://192.168.0.20:8000/api/";

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: "task.png"));

    request.fields['assignmentTask'] = _assignmentData['assignmentTask'];
    request.fields['deadline'] = _assignmentData['deadline'];

    response = await https.Response.fromStream(
      await request.send(),
    );

    var assignmentRes = json.decode(response.body);
    print(assignmentRes);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> classsubjectAssignmentInfo = {
        'classes': _classId,
        'subjects': _subjectId,
        'assignments': assignmentRes['id'].toString(),
      };
      var url = Uri.parse(baseUrl + "classsubjectassignment/");
      https.Response classsubjectAssignment =
          await https.post(url, body: classsubjectAssignmentInfo);

      print(classsubjectAssignment);
      return classsubjectAssignment;
    } else {
      return null;
    }
  }

  // Future<https.Response> setFetchedAssignmentData() async {
  //   final resUrl = "http://192.168.0.20:8000/api/viewassignment/";
  //   var url = Uri.parse(resUrl);
  //   List<Assignment> assignmentList = [];
  //
  //   try {
  //     final response = await https.get(
  //       url,
  //     );
  //     print("Set Fetched Response");
  //     print(response.body);
  //     List assignments = json.decode(response.body);
  //
  //     for (int i = 0; i < assignments.length; i++) {
  //       var assignmentRes = assignments[i];
  //       assignmentList.add(
  //         new Assignment(
  //           assignmentId: assignmentRes['id'].toString(),
  //           task: assignmentRes['assignmentTask'],
  //           deadline: assignmentRes['deadline'],
  //           image: assignmentRes['image'].toString(),
  //         ),
  //       );
  //       _assignments = assignmentList;
  //       notifyListeners();
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }
}
