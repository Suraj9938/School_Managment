import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/event_provider.dart';

class AddEventScreen extends StatefulWidget {
  static const routeName = 'AddEventScreen';

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _eventDay = FocusNode();
  TimeOfDay _finalStartTime;
  TimeOfDay _finalEndTime;
  bool _isLoading = false;
  var _eventStartTime;
  var _eventEndTime;
  String formattedEventDate;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  Uint8List images;
  DateTime _eventDate;

  var _events = {};

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eventDay.dispose();
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

  // Future<DateTime> _userSelectedDate(BuildContext context) {
  //   DateTime _eventDate;
  //
  //   showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime.now(),
  //           lastDate: DateTime(2022))
  //       .then((selectDate) {
  //     setState(() {
  //       _eventDate = selectDate;
  //     });
  //   });
  // }

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

  Future<void> _addEvent() async {
    final isValid = _globalKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _globalKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await Provider.of<EventProvider>(context, listen: false)
          .addEvent(_events, images);
      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Success'),
                  content: Text("Event Added Successfully!"),
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
                  content: Text("Provide valid event details and try again!"),
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
        title: Text(
          "Add Event",
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
            onPressed: _addEvent,
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _globalKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, bottom: 18),
                    child: Text(
                      "Event Information",
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
                                            Icons.event,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          labelText: "Event Name",
                                          labelStyle: TextStyle(
                                              fontSize: 19,
                                              fontFamily: "font2",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange),
                                          border: InputBorder.none),
                                      textInputAction: TextInputAction.next,
                                      focusNode: _eventDay,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Event Name must not be empty';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) =>
                                          _events['eventName'] = value,
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
                                            Icons.view_day,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          labelText: "Event Day",
                                          labelStyle: TextStyle(
                                              fontSize: 19,
                                              fontFamily: "font2",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange),
                                          border: InputBorder.none),
                                      textInputAction: TextInputAction.done,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Event Day must not be empty';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) =>
                                          _events['eventDay'] = value,
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
                                  child: images == null
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
                                "Event Start Time",
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
                                final startTime =
                                    await _selectedStartTime(context);
                                print(startTime);
                                setState(() {
                                  _finalStartTime = startTime;
                                  MaterialLocalizations localization =
                                      MaterialLocalizations.of(context);
                                  if (_finalStartTime != null) {
                                    String formattedStartTime = localization
                                        .formatTimeOfDay(_finalStartTime,
                                            alwaysUse24HourFormat: false);
                                    if (formattedStartTime != null) {
                                      setState(() {
                                        _eventStartTime = formattedStartTime;
                                        _events['eventStartTime'] =
                                            _eventStartTime;
                                      });
                                      print("Formatted Event Time");
                                      print(_eventStartTime);
                                    }
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              _eventStartTime == null
                                  ? "No time selected"
                                  : _eventStartTime,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                fontFamily: "font2",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                                "Event End Time",
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
                                final endTime = await _selectedEndTime(context);
                                print(endTime);
                                setState(() {
                                  _finalEndTime = endTime;
                                  MaterialLocalizations localization =
                                      MaterialLocalizations.of(context);
                                  if (_finalEndTime != null) {
                                    String formattedEndTime = localization
                                        .formatTimeOfDay(_finalEndTime,
                                            alwaysUse24HourFormat: false);
                                    if (formattedEndTime != null) {
                                      setState(() {
                                        _eventEndTime = formattedEndTime;
                                        _events['eventEndTime'] = _eventEndTime;
                                      });
                                      print("Formatted End Time");
                                      print(_eventEndTime);
                                    }
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              _eventEndTime == null
                                  ? "No time selected"
                                  : _eventEndTime,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                fontFamily: "font2",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
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
                                "Event Date",
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
                          height: 15,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    formattedEventDate == null
                                        ? "Select a Date"
                                        : formattedEventDate.toString(),
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
                                        _eventDate = date;
                                        formattedEventDate = DateFormat('MMMMd').format(_eventDate);
                                        _events['eventDate'] = formattedEventDate;
                                      });
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 27,
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
                                  labelText: "About Event",
                                  labelStyle: TextStyle(
                                      fontSize: 19,
                                      color: Colors.orange,
                                      fontFamily: "font2"),
                                  border: InputBorder.none),
                              maxLines: null,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.multiline,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'Event Description must not be empty';
                                }
                                return null;
                              },
                              onChanged: (value) => _events['eventDescription'],
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
