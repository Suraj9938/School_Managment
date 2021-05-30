import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/school.dart';
import 'package:school_management/provider/school_provider.dart';

class AuthProvider with ChangeNotifier {
  List<Auth> _users = [];

  Auth _loggedInUser;

  Auth get LoggedInUser {
    return _loggedInUser;
  }

  List<Auth> get users {
    return [..._users];
  }

  Auth findById(String id) {
    return _users.firstWhere((user) => user.userId == id);
  }

  Future<https.Response> login(String email, String password) async {
    final url = "http://192.168.0.20:8000/api/login/";
    try {
      final response = await https.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      print("Response Data");
      print(response.body);
      var res = json.decode(response.body)['user']; //code reusability
      final user = Auth(
        userId: res['id'].toString(),
        email: res['email'],
        name: res['name'],
        address: res['address'],
        age: res['age'],
        image: res['image'],
        mobileNo: res['mobileNo'],
        gender: res['gender'],
        isLibrarian: res['librarian'],
        isParent: res['parent'],
        isTeacher: res['teacher'],
        isStudent: res['student'],
        isAdmin: res['admin'],
      );
      _loggedInUser = user;
      notifyListeners();
      return response;
    } catch (error) {
      throw (error);
    }
  }

  Future<https.Response> signup(
      BuildContext context, initValues, Uint8List images) async {
    final baseUrl = "http://192.168.0.20:8000/api/";
    final resUrl = baseUrl + "create/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);
    School schoolInfo;
    Provider.of<SchoolProvider>(context, listen: false)
        .setFetchSchoolData()
        .then((value) {
      schoolInfo =
          Provider.of<SchoolProvider>(context, listen: false).schoolData;
    });

    print("schoolInfo");

    request.files
        .add(https.MultipartFile.fromBytes('image', images, filename: 'a.jpg'));

    request.fields['name'] = initValues['name'];
    request.fields['address'] = initValues['address'];
    request.fields['gender'] = initValues['gender'];
    request.fields['age'] = initValues['age'];
    request.fields['mobileNo'] = initValues['mobileNo'];
    request.fields['email'] = initValues['email'];
    request.fields['password'] = initValues['password'];
    request.fields['teacher'] = initValues['isTeacher'].toString();
    request.fields['librarian'] = initValues['isLibrarian'].toString();
    request.fields['student'] = initValues['isStudent'].toString();
    request.fields['parent'] = initValues['isParent'].toString();
    request.fields['admin'] = initValues['isAdmin'].toString();

    https.Response response = await https.Response.fromStream(
      await request.send(),
    );

    var userRes = json.decode(response.body);
    print("User Res");
    print(userRes);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> schoolUserInfo = {
        'user': userRes['id'].toString(),
        'school': schoolInfo.schoolId,
      };
      print("school Id");
      print(schoolInfo.schoolId);
      var url = Uri.parse(baseUrl + 'userschool/');
      https.Response userSchool = await https.post(url, body: schoolUserInfo);
      print("From Auth Provider user school");
      print(userSchool);
      return userSchool;
    } else {
      return response;
    }
  }

  Future<https.Response> setFetchedUsersData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewuser/";
    var url = Uri.parse(resUrl);
    List<Auth> userList = [];

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);

      List users = json.decode(response.body);
      _users.clear();
      for (int i = 0; i < users.length; i++) {
        var userRes = users[i];
        userList.add(
          new Auth(
            userId: userRes['id'].toString(),
            name: userRes['name'],
            address: userRes['address'],
            image: userRes['image'].toString(),
            gender: userRes['gender'],
            age: userRes['age'],
            mobileNo: userRes['mobileNo'],
            email: userRes['email'],
            password: userRes['password'],
            isAdmin: userRes['admin'],
            isTeacher: userRes['teacher'],
            isParent: userRes['parent'],
            isStudent: userRes['student'],
            isLibrarian: userRes['librarian'],
          ),
        );
      }
      _users = userList;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<https.Response> updateUserInfo(
      String userId, initValues, images) async {
    ///final userId = _users.indexWhere((user) => user.userId == id);
    final resUrl = "http://192.168.0.20:8000/api/updateuser/$userId/";
    var url = Uri.parse(resUrl);

    try {
      final request = https.MultipartRequest('PATCH', url);
      //request.
      //if (images != null) request.fields['image'] = images.toString();

      // request.files.add(
      //     https.MultipartFile.fromBytes('image', images, filename: 'a.jpg'));

      print("From Auth Provider");
      print(initValues['name']);
      print(initValues['address']);
      print(initValues['gender']);
      print(initValues['age']);
      print(initValues['mobileNo']);
      print(initValues['email']);
      print(initValues['password']);
      print(initValues['isTeacher']);
      request.fields['name'] = initValues['name'];
      request.fields['address'] = initValues['address'];
      request.fields['gender'] = initValues['gender'];
      request.fields['age'] = initValues['age'];
      request.fields['mobileNo'] = initValues['mobileNo'];
      request.fields['email'] = initValues['email'];
      request.fields['password'] = initValues['password'];
      request.fields['teacher'] = initValues['isTeacher'].toString();
      request.fields['librarian'] = initValues['isLibrarian'].toString();
      request.fields['student'] = initValues['isStudent'].toString();
      request.fields['parent'] = initValues['isParent'].toString();
      request.fields['admin'] = initValues['isAdmin'].toString();

      https.Response response = await https.Response.fromStream(
        await request.send(),
      );
      print(
          "-----------------------------------------------------update user01");
      print(response.body);
      print("----------------------------");
      return response;
    } catch (error) {
      print("----------------------update errir");
      print(error);
      return null;
      print("-----------------------------------");
      //return null;
    }
  }

  Future<https.Response> deleteUserByID(String userId) async {
    final resUrl = "http://192.168.0.20:8000/api/deleteuser/$userId/";
    var url = Uri.parse(resUrl);
    https.Response response = await https.delete(url);

    return response;
  }
//   try {
//     if (userId >= 0) {
//       print("----------------i was called here");
//       final _httpPatchResponse = await https.patch(
//         url,
//         body: json.encode(
//           {
//             'name': _editedUserData['name'],
//             'address': _editedUserData['address'],
//             'image': _editedUserData['image'].toString(),
//             'gender': _editedUserData['gender'],
//             'age': _editedUserData['age'],
//             'mobileNo': _editedUserData['mobileNo'],
//             'email': _editedUserData['email'],
//             'password': _editedUserData['password'],
//             'admin': _editedUserData['isAdmin'].toString(),
//             'teacher': _editedUserData['isTeacher'].toString(),
//             'parent': _editedUserData['isParent'].toString(),
//             'student': _editedUserData['isStudent'].toString(),
//             'librarian': _editedUserData['isLibrarian'].toString(),
//           },
//         ),
//         headers: {'Content-Type': 'application/json'},
//       );
//       print(_httpPatchResponse.body);
//       print("----------------------${_httpPatchResponse.statusCode}");
//       if (_httpPatchResponse.statusCode == 201 ||
//           _httpPatchResponse.statusCode == 200) {
//         _users[userId] = _editedUserData;
//         notifyListeners();
//         return 200;
//       }
//     }
//     return 401;
//   } catch (error) {
//     return 401;
//   }
// }
}
