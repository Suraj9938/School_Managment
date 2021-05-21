import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/class.dart';

class ClassSubjectProvider with ChangeNotifier {
  Future<https.Response> addClassSubject(
      Class _selectedClass, List<String> subjects) async {
    final resUrl = "https://192.168.0.20:8000/api/addclasssubject/";
    var url = Uri.parse(resUrl);

    for (int i = 0; i < subjects.length; i++) {
      Map<String, String> classSubjectInfo = {
        'classes': _selectedClass.classId.toString(),
        'subject': subjects[i].toString(),
      };
      https.Response classSubject =
          await https.post(url, body: classSubjectInfo);
      print("classSubject from Class Subject Provider");
      print(classSubject);
      return classSubject;
    }
  }
}
