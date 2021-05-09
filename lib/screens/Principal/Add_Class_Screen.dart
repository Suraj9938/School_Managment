import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/subject_provider.dart';

class AddClassScreen extends StatefulWidget {
  static const routeName = "/add_class";

  @override
  _AddClassScreenState createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  var _class = {};
  final GlobalKey<FormState> _globalKey = GlobalKey();
  var _isLoading = false;

  Future<void> _addClass() async {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await Provider.of<ClassProvider>(context, listen: false)
          .addClass(_class);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Success'),
                  content: Text("Class Added Successfully!"),
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
                  content: Text("Provide valid class detail and try again!"),
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
          "Add Class",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: _addClass),
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
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.class_,
                          color: Colors.orange,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: "Class Name",
                        labelStyle: TextStyle(
                          fontFamily: "font2",
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
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
                          return 'Class Name must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value) => _class['className'] = value,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
