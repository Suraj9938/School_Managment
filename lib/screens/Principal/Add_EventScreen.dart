import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatefulWidget {
  static const routeName = 'AddEventScreen';
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _eventDay = FocusNode();
  TimeOfDay _finalStartTime;
  TimeOfDay _finalEndTime;
  var _schoolStartTime;
  var _schoolEndTime;

  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eventDay.dispose();
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

  void userSelectedDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((selectDate) {
      setState(() {
        _dateTime = selectDate;
      });
    });
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
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Form(
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
                            width: MediaQuery.of(context).size.width / 2 + 4,
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
                                // onSaved: (value) {
                                //   _editedBook = BookProvider(
                                //     id: _editedBook.id,
                                //     bookName: _editedBook.bookName,
                                //     bookImage: _editedBook.bookImage,
                                //     bookType: value.trimLeft().trim(),
                                //     categoryId: _editedBook.categoryId,
                                //     publisher: _editedBook.publisher,
                                //     publishYear: _editedBook.publishYear,
                                //     userRating: _editedBook.userRating,
                                //     ratingNo: _editedBook.ratingNo,
                                //     bookDescription: _editedBook.bookDescription,
                                //     isTopGrossing: _editedBook.isTopGrossing,
                                //   );
                                // },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 + 4,
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
                                    return 'Staff Address must not be empty';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _editedBook = BookProvider(
                                //     id: _editedBook.id,
                                //     bookName: _editedBook.bookName,
                                //     bookImage: _editedBook.bookImage,
                                //     bookType: value.trimLeft().trim(),
                                //     categoryId: _editedBook.categoryId,
                                //     publisher: _editedBook.publisher,
                                //     publishYear: _editedBook.publishYear,
                                //     userRating: _editedBook.userRating,
                                //     ratingNo: _editedBook.ratingNo,
                                //     bookDescription: _editedBook.bookDescription,
                                //     isTopGrossing: _editedBook.isTopGrossing,
                                //   );
                                // },
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
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      child: Container(
                        width: 190,
                        color: Colors.orange,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select a Date",
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
                        //focusNode: _bookDescription,
                        // onFieldSubmitted: (_) {
                        //   FocusScope.of(context).requestFocus(_imageUrl);
                        // },
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Book Description must not be empty';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _editedBook = BookProvider(
                        //     id: _editedBook.id,
                        //     bookName: _editedBook.bookName,
                        //     bookImage: _editedBook.bookImage,
                        //     bookType: _editedBook.bookType,
                        //     categoryId: _editedBook.categoryId,
                        //     publisher: _editedBook.publisher,
                        //     publishYear: _editedBook.publishYear,
                        //     userRating: _editedBook.userRating,
                        //     ratingNo: _editedBook.ratingNo,
                        //     bookDescription: value.trimLeft().trim(),
                        //     isTopGrossing: _editedBook.isTopGrossing,
                        //   );
                        // },
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
