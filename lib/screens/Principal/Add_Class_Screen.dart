import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/subject_provider.dart';

class AddClassScreen extends StatefulWidget {
  static const routeName = 'addclass';

  @override
  _AddClassScreenState createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  final _form = GlobalKey<FormState>();
  bool _checkboxListTile = false;
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;

  @override
  Widget build(BuildContext context) {
    final subjectData = Provider.of<SubjectProvider>(context, listen: false)
        .setFetchSubjectData();
    final subjects =
        Provider.of<SubjectProvider>(context, listen: false).subjects;
    print("subjectData");
    print(subjectData);
    print("subjects");
    print(subjects);

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
      body: Container(
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
                    contentPadding: EdgeInsets.only(bottom: 20, right: 20),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
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
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "English(Grade 4)",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 16,
                ),
              ),
              value: _checkboxListTile,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile = !_checkboxListTile;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Mathematics(Grade 5)",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 16,
                ),
              ),
              value: _checkboxListTile1,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile1 = !_checkboxListTile1;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "History(Grade 5)",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 16,
                ),
              ),
              value: _checkboxListTile1,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile1 = !_checkboxListTile1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
