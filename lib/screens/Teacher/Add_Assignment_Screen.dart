import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/model/subject.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/class_subject_provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/screens/Teacher/Class_Details_Screen.dart';
import 'package:school_management/widget/Principal/Subject_CheckBox_ListView.dart';

class AddAssignmentScreen extends StatefulWidget {
  List<ClassSubject> _currentClass;
  Subject _selectedSubject;
  List<String> subjects = [];

  static const routeName = "/add_assignment";

  @override
  _AddAssignmentScreenState createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  bool _isInit = false;
  bool _isLoading = false;
  List<Subject> _subjects;
  List<ClassSubject> _classSubject = [];

  Future<void> _fetchClassSubjects(BuildContext context) async {
    await Provider.of<SubjectProvider>(context, listen: false)
        .setFetchSubjectData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ClassSubjectProvider>(context, listen: false)
          .setFetchClassSubjectData()
          .then((value) {
        print("new");
        _classSubject =
            Provider.of<ClassSubjectProvider>(context, listen: false)
                .classSubjects;
        // final _classSubjectData =
        //     Provider.of<ClassSubject>(context, listen: false);
        // final _classData = Provider.of<Class>(context, listen: false);
        // if (_classSubjectData.classes == _classData.classId) {
        //   _subjects =
        //       Provider.of<SubjectProvider>(context, listen: false).subjects;
        // widget._selectedSubject = _subjects[0];
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Assignment",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 15,
          top: 10,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: ListTile(
                title: Text(_classSubject[index].classes.className),
                onTap: () => Navigator.pushNamed(
                  context,
                  ClassDetails.routeName,
                  arguments: _classSubject[index].classSubjectId,
                ),
              ),
            );
          },
          itemCount: _classSubject.length,
        ),
      ),
    );
  }
}
