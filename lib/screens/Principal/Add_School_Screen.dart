import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/school.dart';
import 'package:school_management/provider/school_provider.dart';

class AddSchoolScreen extends StatefulWidget {
  static const routeName = 'AddSchoolScreen';

  @override
  _AddSchoolScreenState createState() => _AddSchoolScreenState();
}

class _AddSchoolScreenState extends State<AddSchoolScreen> {
  final _schoolContact = FocusNode();
  final _schoolDescription = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  TimeOfDay _finalStartTime;
  TimeOfDay _finalEndTime;
  var _schoolStartTime;
  var _schoolEndTime;

  var _schoolData = School(
    schoolName: "",
    schoolContact: "",
    schoolImage: "",
    schoolDescription: "",
    location: "",
    startTime: "",
    endTime: "",
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _schoolContact.dispose();
  }

  File imagePath;
  ImagePicker _selectedImage = ImagePicker();

  Future<void> _getImage(ImageSource image) async {
    try {
      imagePath = File((await _selectedImage.getImage(source: image)).path);
      setState(() {
        if (imagePath != null) {
          imagePath = File(imagePath.path);
        } else {
          print('No Image Selected!');
        }
      });
    } catch (error) {
      throw error;
    }
  }

  Future<TimeOfDay> _selectedStartTime(BuildContext context) {
    final startTime = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: startTime.hour,
        minute: startTime.minute,
      ),
    );
  }

  Future<TimeOfDay> _selectedEndTime(BuildContext context) {
    final endTime = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: endTime.hour,
        minute: endTime.minute,
      ),
    );
  }

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
      await Provider.of<SchoolProvider>(context, listen: false)
          .addSchool(_schoolData);
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Success"),
                content: Text("School Added Successfully"),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    } catch (error) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Error Occured'),
                content: Text('School cannot be registered'),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ));
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add School",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.white,
            onPressed: () {
              _saveForm();
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading
          ? (Center(
              child: CircularProgressIndicator(),
            ))
          : Form(
              key: _form,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, bottom: 18),
                    child: Text(
                      "School Information",
                      style: TextStyle(
                        fontFamily: "font2",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 2 + 4,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.grey[300],
                                    child: TextFormField(
                                      //initialValue: initValues['bookType'],
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.school_outlined,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          labelText: "School Name",
                                          labelStyle: TextStyle(
                                              fontSize: 19,
                                              fontFamily: "font2",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange),
                                          border: InputBorder.none),
                                      textInputAction: TextInputAction.next,
                                      focusNode: _schoolContact,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'School Name must not be empty';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _schoolData = School(
                                          schoolId: _schoolData.schoolId,
                                          schoolName: value.trimLeft().trim(),
                                          schoolContact:
                                              _schoolData.schoolContact,
                                          schoolImage: _schoolData.schoolImage,
                                          schoolDescription:
                                              _schoolData.schoolDescription,
                                          location: _schoolData.location,
                                          startTime: _schoolData.startTime,
                                          endTime: _schoolData.endTime,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 2 + 4,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.grey[300],
                                    child: TextFormField(
                                      //initialValue: initValues['bookType'],
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.contact_phone_outlined,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          labelText: "School Contact",
                                          labelStyle: TextStyle(
                                              fontSize: 19,
                                              fontFamily: "font2",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Staff Contact must not be empty';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _schoolData = School(
                                          schoolId: _schoolData.schoolId,
                                          schoolName: _schoolData.schoolName,
                                          schoolContact:
                                              value.trimLeft().trim(),
                                          schoolImage: _schoolData.schoolImage,
                                          schoolDescription:
                                              _schoolData.schoolDescription,
                                          location: _schoolData.location,
                                          startTime: _schoolData.startTime,
                                          endTime: _schoolData.endTime,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                height: 132,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                color: Colors.blueGrey[200],
                                child: RaisedButton(
                                  child: imagePath == null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          imagePath,
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
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width - 28,
                          child: Row(
                            children: [
                              Icon(
                                Icons.wc_outlined,
                                color: Colors.orange,
                                size: 22,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "School Start Time",
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
                          height: 12,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              color: Colors.orange,
                              child: Text(
                                "Choose start time",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                final startDate =
                                    await _selectedStartTime(context);
                                print(startDate);
                                setState(() {
                                  _finalStartTime = startDate;
                                  MaterialLocalizations localization =
                                      MaterialLocalizations.of(context);
                                  if (_finalStartTime != null) {
                                    String formattedStartTime = localization
                                        .formatTimeOfDay(_finalStartTime,
                                            alwaysUse24HourFormat: false);
                                    if(formattedStartTime != null) {
                                      _schoolStartTime = formattedStartTime;
                                      print("Formatted Start Time");
                                      print(_schoolStartTime);
                                    }
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              _schoolStartTime == null
                                  ? "No time selected"
                                  : _schoolStartTime,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                fontFamily: "font2",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width - 28,
                          child: Row(
                            children: [
                              Icon(
                                Icons.wc_outlined,
                                color: Colors.orange,
                                size: 22,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "School End Time",
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
                          height: 12,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              color: Colors.orange,
                              child: Text(
                                "Choose end time",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                final endDate =
                                await _selectedEndTime(context);
                                print(endDate);
                                setState(() {
                                  _finalEndTime = endDate;
                                  MaterialLocalizations localization =
                                  MaterialLocalizations.of(context);
                                  if (_finalEndTime != null) {
                                    String formattedEndTime = localization
                                        .formatTimeOfDay(_finalEndTime,
                                        alwaysUse24HourFormat: false);
                                    if(formattedEndTime != null) {
                                      _schoolEndTime = formattedEndTime;
                                      print("Formatted End Time");
                                      print(_schoolEndTime);
                                    }
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              _schoolEndTime == null
                                  ? "No time selected"
                                  : _schoolEndTime,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                fontFamily: "font2",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 120,
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: TextFormField(
                              //initialValue: initValues['bookType'],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  labelText: "School Location",
                                  labelStyle: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "font2",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange),
                                  border: InputBorder.none),
                              textInputAction: TextInputAction.next,
                              focusNode: _schoolDescription,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Staff Location must not be empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _schoolData = School(
                                  schoolId: _schoolData.schoolId,
                                  schoolName: _schoolData.schoolName,
                                  schoolContact: _schoolData.schoolContact,
                                  schoolImage: _schoolData.schoolImage,
                                  schoolDescription:
                                      _schoolData.schoolDescription,
                                  location: value.trimLeft().trim(),
                                  startTime: _schoolData.startTime,
                                  endTime: _schoolData.endTime,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Container(
                          height: 170,
                          padding: EdgeInsets.only(
                            right: 30,
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: TextFormField(
                              //initialValue: initValues['bookDescription'],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.description,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  labelText: "School Description",
                                  labelStyle: TextStyle(
                                      fontSize: 19,
                                      color: Colors.orange,
                                      fontFamily: "font2"),
                                  border: InputBorder.none),
                              maxLines: null,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.multiline,
                              // onFieldSubmitted: (_) {
                              //   FocusScope.of(context).requestFocus(_imageUrl);
                              // },
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'School Description must not be empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _schoolData = School(
                                  schoolId: _schoolData.schoolId,
                                  schoolName: _schoolData.schoolName,
                                  schoolContact: _schoolData.schoolContact,
                                  schoolImage: _schoolData.schoolImage,
                                  schoolDescription: value.trimLeft().trim(),
                                  location: _schoolData.location,
                                  startTime: _schoolData.startTime,
                                  endTime: _schoolData.endTime,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
