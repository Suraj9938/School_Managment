import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/widget/Principal/Subject_CheckBox_ListView.dart';

class AddClassSubjectScreen extends StatefulWidget {
  static const routeName = '/AddClassSubject';
  List<String> subjectNames = [];

  @override
  _AddClassSubjectScreenState createState() => _AddClassSubjectScreenState();
}

class _AddClassSubjectScreenState extends State<AddClassSubjectScreen> {
  var _class = {};
  final _form = GlobalKey<FormState>();

  Future<void> _fetchSubjects(BuildContext context) async {
    await Provider.of<SubjectProvider>(context, listen: false)
        .setFetchSubjectData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final classInfo =
        Provider.of<ClassProvider>(context, listen: false).AddClassSubject(_class);
    print("Subject Names From Add Class Screen");
    print(widget.subjectNames);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Classes",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: FutureBuilder(
        future: _fetchSubjects(context),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Class Information",
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        height: 60,
                        child: Material(
                          borderRadius: BorderRadius.circular(34),
                          color: Colors.grey[300],
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.class_,
                                color: Colors.orange,
                                size: 20,
                              ),
                              labelText: "Class Name",
                              labelStyle: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange),
                              focusColor: Colors.red,
                              contentPadding:
                                  EdgeInsets.only(bottom: 20, right: 20),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (value) => _class['className'] = value,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          "Available Subjects",
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SubjectCheckBoxListView(widget.subjectNames),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
