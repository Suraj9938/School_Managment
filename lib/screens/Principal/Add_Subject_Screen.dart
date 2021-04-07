import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  static const routeName = "/addsubject";

  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  var _subject = {};
  final GlobalKey<FormState> _globalKey = GlobalKey();
  var _isLoading = false;

  Future<void> _addSubject() async {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await Provider.of<SubjectProvider>(context, listen: false)
              .addSubject(_subject);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Success'),
                  content: Text("Subject Added Successfully!"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      } else if (response.statusCode >= 300 && response.statusCode < 400 ||
          response.statusCode == 500) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occurred!'),
                  content: Text("Something went wrong."),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      } else if (response.statusCode == 400 && response.statusCode < 500) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occurred'),
                  content: Text("Provide valid subject detail and try again!"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      }
    } catch (error) {
      throw (error);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Subjects",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: _addSubject),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _globalKey,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Material(
                        borderRadius: BorderRadius.circular(34),
                        color: Colors.grey[300],
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.subject,
                              color: Colors.orange,
                            ),
                            labelText: "Subject Name",
                            labelStyle: TextStyle(
                              fontFamily: "font2",
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.orange,
                            ),
                            focusColor: Colors.red,
                            contentPadding:
                                EdgeInsets.only(bottom: 20, right: 20),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Subject Name must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => _subject['subjectName'] = value,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
