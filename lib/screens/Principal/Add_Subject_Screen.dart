import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  static const routeName = "/AddSubject";

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

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.orange,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Add Subject",
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.orange,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: "Subject Name",
                        labelStyle: TextStyle(
                          fontFamily: "font2",
                          fontWeight: FontWeight.normal,
                          fontSize: 19,
                          color: Colors.orange,
                        ),
                        focusColor: Colors.red,
                        border: _outlineBorder(),
                        enabledBorder: _outlineBorder(),
                        errorBorder: _outlineBorder(),
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
                  ],
                ),
              ),
            ),
    );
  }
}
