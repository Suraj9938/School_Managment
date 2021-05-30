import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/model/subject.dart';
import 'package:school_management/provider/assignment_provider.dart';
import 'package:school_management/provider/class_subject_provider.dart';
import 'package:school_management/screens/Teacher/Add_Assignment_Screen.dart';
import 'package:school_management/screens/Teacher/Class_Details_Screen.dart';

class AddNewAssignment extends StatefulWidget {
  static const routeName = "/add_new_assignment";

  @override
  _AddNewAssignmentState createState() => _AddNewAssignmentState();
}

class _AddNewAssignmentState extends State<AddNewAssignment> {
  String formattedDeadlineDate;
  final _form = GlobalKey<FormState>();
  DateTime _assignmentDate;
  Uint8List images;
  bool _isLoading = false;
  var _assignmentData = {};

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.orange,
      ),
      borderRadius: BorderRadius.circular(18),
    );
  }

  File userImage;
  ImagePicker _selectedImage = ImagePicker();

  Future<void> _getImage(ImageSource image) async {
    try {
      final imagePath =
          await _selectedImage.getImage(source: ImageSource.gallery);
      if (imagePath != null) {
        var imageBytes = await imagePath.readAsBytes();
        setState(() {
          userImage = File(imagePath.path);
          images = imageBytes;
        });
      } else {
        print('No Image Selected!');
      }
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    print("Id From Add New Assignment Screen");
    var _classId = args['classId'];
    var _subjectId = args['subjectId'];
    print(_classId);
    print(_subjectId);

    Future<void> _saveForm() async {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        final response =
            await Provider.of<AssignmentProvider>(context, listen: false)
                .addAssignment(_assignmentData, images, _classId, _subjectId);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Success'),
                    content: Text("Assignment was added successfully"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Okay'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      )
                    ],
                  )).then(
            (value) => Navigator.of(context)
                .pushReplacementNamed(AddAssignmentScreen.routeName),
          );
        } else if (response.statusCode >= 300 && response.statusCode < 400 ||
            response.statusCode == 500) {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('An error Occured'),
                    content: Text("Assignment addition failed!"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Okay'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      )
                    ],
                  ));
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('An Error Occurred!'),
                    content: Text(
                        "Provide Valid Assignment Credentials and try again!"),
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
        print(error);
      }
      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Assignment",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => _saveForm(),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _form,
        child: Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width - 28,
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.orange,
                      size: 22,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Assignment Deadline",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "font2",
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 6,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedDeadlineDate == null
                              ? "Select a Date"
                              : formattedDeadlineDate.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font2",
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 28,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2022))
                          .then((date) {
                        setState(() {
                          _assignmentDate = date;
                          formattedDeadlineDate =
                              DateFormat('MMMMd').format(_assignmentDate);
                          _assignmentData['deadline'] = formattedDeadlineDate;
                        });
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_pin,
                      color: Colors.orange,
                      size: 20,
                    ),
                    fillColor: Colors.grey[300],
                    filled: true,
                    labelText: "Task for Assignment",
                    labelStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: "font2",
                        fontWeight: FontWeight.w500,
                        color: Colors.orange),
                    border: _outlineBorder(),
                    enabledBorder: _outlineBorder(),
                    errorBorder: _outlineBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    //FocusScope.of(context).requestFocus(_userAddress);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Assignment Task must not be empty';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      _assignmentData['assignmentTask'] = value,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Text(
                      "Select Image For Assignment",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "font2",
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 132,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      color: Colors.blueGrey[200],
                      child: RaisedButton(
                        child: images == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.orange,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Choose an Image",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "font2",
                                      color: Colors.orange,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Image.file(
                                userImage,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                        onPressed: () {
                          _getImage(ImageSource.gallery);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
