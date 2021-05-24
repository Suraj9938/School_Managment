// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:school_management/model/auth.dart';
// import 'package:school_management/provider/auth_provider.dart';
//
// class StudentDropDownListView extends StatefulWidget {
//   Auth _selectedUser;
//
//   StudentDropDownListView(this._selectedUser);
//
//   @override
//   _StudentDropDownListViewState createState() =>
//       _StudentDropDownListViewState();
// }
//
// class _StudentDropDownListViewState extends State<StudentDropDownListView> {
//   bool _isInit = false;
//   bool _isLoading = false;
//   List<Auth> _users;
//   List<Auth> _user = [];
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_isInit) {
//       setState(() {
//         _isLoading = true;
//       });
//       Provider.of<AuthProvider>(context, listen: false)
//           .setFetchedUsersData()
//           .then((value) {
//         _users = Provider.of<AuthProvider>(context, listen: false).users;
//
//         _users.forEach((element) {
//           if (element.isStudent || element.isTeacher || element.isParent) {
//             _user.add(element);
//           }
//         });
//         print(_user);
//         widget._selectedUser = _user[0];
//         setState(() {
//           _isLoading = false;
//         });
//       });
//     }
//     _isInit = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? Center(
//             child: Container(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : Container(
//             width: double.infinity,
//             height: 50,
//             child: DropdownButton<Auth>(
//               items: _user
//                   .map(
//                     (e) => DropdownMenuItem(
//                       child: Text(e.name),
//                       value: e,
//                     ),
//                   )
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   widget._selectedUser = value;
//                 });
//                 print(widget._selectedUser.name);
//               },
//               value: widget._selectedUser,
//             ),
//           );
//   }
// }
