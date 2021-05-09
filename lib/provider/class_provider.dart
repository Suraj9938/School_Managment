import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/class.dart';

class ClassProvider with ChangeNotifier {
  List<Class> _classes = [];

  List<Class> get classes {
    return [..._classes];
  }

  Future<https.Response> addClass(_class) async {
    final url = "http://192.168.0.20:8000/api/addclass/";
    try {
      final https.Response response = await https.post(
        url,
        body: json.encode(
          {
            'className': _class['className'],
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      print(response.statusCode);
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<void> setFetchClassData() async {
    final url = "http://192.168.0.20:8000/api/viewclass/";
    List<Class> classList = [];
    try {
      final response = await https.get(
        url
      );
      List classes = json.decode(response.body);

      for (int i = 0; i < classes.length; i++) {
        classList.add(new Class(
          classId: classes[i]['id'].toString(),
          className: classes[i]['className'],
        ),);
      }
      _classes = classList;
      notifyListeners();
    } catch (error) {
      // throw error;
      return null;
    }
  }

// Future<https.Response> addClass(_class) async {
//   final url = "http://192.168.0.20:8000/api/addclass/";
//   final baseUrl = "http://192.168.0.20:8000/api/";
//
//   try {
//     final https.Response response = await https.post(
//       url,
//       body: json.encode(
//         {
//           'className': _class['className'],
//         },
//       ),
//       headers: {'Content-Type': 'application/json'},
//     );
//     print(response.body);
//     print(response.statusCode);
//
//     var classRes = json.decode(response.body);
//
//     if(response.statusCode == 200 || response.statusCode == 201){
//       Map<String, String> classSubjectInfo = {
//         'class': classRes['id'].toString(),
//
//       };
//       print("class id");
//       var url = Uri.parse(baseUrl + '');
//     } else {
//       return response;
//     }
//     return response;
//   } catch (error) {
//     throw (error);
//   }
// }
}
