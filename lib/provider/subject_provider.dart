import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;

class SubjectProvider with ChangeNotifier {
  Future<https.Response> addSubject(_subject) async {
    final url = "http://192.168.0.14/api/addsubject/";
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
}
