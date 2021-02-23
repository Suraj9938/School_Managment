import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddSchoolScreen extends StatefulWidget {
  static const routeName = 'AddSchoolScreen';

  @override
  _AddSchoolScreenState createState() => _AddSchoolScreenState();
}

class _AddSchoolScreenState extends State<AddSchoolScreen> {
  final _schoolContact = FocusNode();
  final _schoolDescription = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _schoolContact.dispose();
  }

  var _startHourTimes = [
    'HOUR',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];
  var _currentStartHourTime = 'HOUR';
  var _startMinuteTimes = [
    'MIN',
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59'
  ];
  var _currentStartMinuteTime = 'MIN';
  var _startTime = ['am', 'pm'];
  var _currentStartTime = 'am';

  var _endHourTimes = [
    'HOUR',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];
  var _currentEndHourTime = 'HOUR';
  var _endMinuteTimes = [
    'MIN',
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59'
  ];
  var _currentEndMinuteTime = 'MIN';
  var _endTime = ['am', 'pm'];
  var _currentEndTime = 'am';

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
            onPressed: () {},
          ),
        ],
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
                            width: MediaQuery.of(context).size.width / 2 + 4,
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
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: Colors.blueGrey[200],
                          child: RaisedButton(
                            child: imagePath == null
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
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items: _startHourTimes
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentStartHourTime =
                                        newValueSelected;
                                  });
                                },
                                value: _currentStartHourTime,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items: _startMinuteTimes
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentStartMinuteTime =
                                        newValueSelected;
                                  });
                                },
                                value: _currentStartMinuteTime,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items:
                                    _startTime.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentStartTime = newValueSelected;
                                  });
                                },
                                value: _currentStartTime,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items: _endHourTimes
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentEndHourTime = newValueSelected;
                                  });
                                },
                                value: _currentEndHourTime,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items: _endMinuteTimes
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentEndMinuteTime =
                                        newValueSelected;
                                  });
                                },
                                value: _currentEndMinuteTime,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: DropdownButton<String>(
                                items:
                                    _endTime.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentEndTime = newValueSelected;
                                  });
                                },
                                value: _currentEndTime,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
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
