import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/SchoolOverViewScreen.dart';
import 'package:school_management/provider/school_provider.dart';

enum SchoolTabs { AboutSchool, Description }

SchoolTabs _schoolTabs = SchoolTabs.AboutSchool;

class ManageSchoolScreen extends StatefulWidget {
  static const routeName = 'ManageSchoolScreen';

  @override
  _ManageSchoolScreenState createState() => _ManageSchoolScreenState();
}

class _ManageSchoolScreenState extends State<ManageSchoolScreen> {
  final _schoolContact = FocusNode();
  final _schoolDescription = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  TimeOfDay _finalStartTime;
  TimeOfDay _finalEndTime;
  var _schoolStartTime;
  var _schoolEndTime;
  Uint8List images;

  var _schoolData = {};

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _schoolContact.dispose();
  }

  File schoolImage;
  ImagePicker _selectedImage = ImagePicker();

  Future<void> _getImage(ImageSource image) async {
    try {
      final imagePath =
          await _selectedImage.getImage(source: ImageSource.gallery);
      if (imagePath != null) {
        var imageBytes = await imagePath.readAsBytes();
        setState(() {
          schoolImage = File(imagePath.path);
          images = imageBytes;
        });
      } else {
        print('No Image Selected!');
      }
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
      // await Provider.of<SchoolProvider>(context, listen: false)
      //     .addSchool(_schoolData, images);
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
    final schoolData =
        Provider.of<SchoolProvider>(context, listen: false).schoolData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About School",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.check),
        //     color: Colors.white,
        //   ),
        // ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<SchoolProvider>(context, listen: false)
            .setFetchSchoolData(),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2 - 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              schoolData.schoolImage,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(40, 30),
                            bottomRight: Radius.elliptical(40, 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 15,
                        ),
                        child: Text(
                          schoolData.schoolName,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "font1",
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _schoolTabs = SchoolTabs.AboutSchool;
                                });
                              },
                              color: _schoolTabs == SchoolTabs.AboutSchool
                                  ? Colors.orange
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                child: Text(
                                  "About School",
                                  style: TextStyle(
                                    color: _schoolTabs == SchoolTabs.AboutSchool
                                        ? Colors.white
                                        : Colors.grey[600],
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _schoolTabs = SchoolTabs.Description;
                                });
                              },
                              color: _schoolTabs == SchoolTabs.Description
                                  ? Colors.orange
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    color: _schoolTabs == SchoolTabs.Description
                                        ? Colors.white
                                        : Colors.grey[600],
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _schoolTabs == SchoolTabs.AboutSchool
                          ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      leading: IconButton(
                                        icon: Icon(
                                          Icons.location_on_sharp,
                                          size: 30,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      title: Container(
                                        height: 54,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "School Location",
                                              style: TextStyle(
                                                fontFamily: "font1",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              schoolData.location,
                                              style: TextStyle(
                                                fontFamily: "font2",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      leading: IconButton(
                                        icon: Icon(
                                          Icons.contact_phone_outlined,
                                          size: 25,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      title: Container(
                                        height: 54,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Contact Number",
                                              style: TextStyle(
                                                fontFamily: "font1",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              schoolData.schoolContact,
                                              style: TextStyle(
                                                fontFamily: "font2",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      leading: IconButton(
                                        icon: Icon(
                                          Icons.access_time_outlined,
                                          size: 30,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      title: Container(
                                        height: 54,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Time Period",
                                              style: TextStyle(
                                                fontFamily: "font1",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              schoolData.startTime + " - " + schoolData.endTime,
                                              style: TextStyle(
                                                fontFamily: "font2",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      _schoolTabs == SchoolTabs.Description
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 4,
                                  ),
                                  child: Container(
                                    height: 200,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "School BioData",
                                          style: TextStyle(
                                            fontFamily: "font1",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                            fontSize: 24,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          schoolData.schoolDescription,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "font2",
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         "Add School",
//         style: TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.w700,
//           fontFamily: "font1",
//           color: Colors.white,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.check),
//           color: Colors.white,
//           onPressed: () {
//             _saveForm();
//           },
//         ),
//       ],
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//     ),
//     body: _isLoading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Form(
//             key: _form,
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 13, bottom: 18),
//                   child: Text(
//                     "School Information",
//                     style: TextStyle(
//                       fontFamily: "font2",
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 13),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 60,
//                                 width:
//                                     MediaQuery.of(context).size.width / 2 + 4,
//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(18),
//                                   color: Colors.grey[300],
//                                   child: TextFormField(
//                                     //initialValue: initValues['bookType'],
//                                     decoration: InputDecoration(
//                                         prefixIcon: Icon(
//                                           Icons.school_outlined,
//                                           color: Colors.orange,
//                                           size: 20,
//                                         ),
//                                         labelText: "School Name",
//                                         labelStyle: TextStyle(
//                                             fontSize: 19,
//                                             fontFamily: "font2",
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.orange),
//                                         border: InputBorder.none),
//                                     textInputAction: TextInputAction.next,
//                                     focusNode: _schoolContact,
//                                     validator: (value) {
//                                       if (value.isEmpty) {
//                                         return 'School Name must not be empty';
//                                       }
//                                       return null;
//                                     },
//                                     onChanged: (value) => _schoolData['name'],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 12,
//                               ),
//                               Container(
//                                 height: 60,
//                                 width:
//                                     MediaQuery.of(context).size.width / 2 + 4,
//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(18),
//                                   color: Colors.grey[300],
//                                   child: TextFormField(
//                                     //initialValue: initValues['bookType'],
//                                     decoration: InputDecoration(
//                                         prefixIcon: Icon(
//                                           Icons.contact_phone_outlined,
//                                           color: Colors.orange,
//                                           size: 20,
//                                         ),
//                                         labelText: "School Contact",
//                                         labelStyle: TextStyle(
//                                             fontSize: 19,
//                                             fontFamily: "font2",
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.orange),
//                                         border: InputBorder.none),
//                                     keyboardType: TextInputType.number,
//                                     textInputAction: TextInputAction.done,
//                                     validator: (value) {
//                                       if (value.isEmpty) {
//                                         return 'Contact must not be empty';
//                                       }
//                                       return null;
//                                     },
//                                     onChanged: (value) =>
//                                         _schoolData['contact'],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(18),
//                             child: Container(
//                               height: 132,
//                               width:
//                                   MediaQuery.of(context).size.width / 2 - 40,
//                               color: Colors.blueGrey[200],
//                               child: RaisedButton(
//                                 child: images == null
//                                     ? Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.camera,
//                                             color: Colors.orange,
//                                             size: 24,
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           Text(
//                                             "Choose an Image",
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontFamily: "font2",
//                                               color: Colors.orange,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ],
//                                       )
//                                     : Image.file(
//                                         schoolImage,
//                                         fit: BoxFit.contain,
//                                         width: double.infinity,
//                                       ),
//                                 onPressed: () {
//                                   _getImage(ImageSource.gallery);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 24,
//                       ),
//                       Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width - 28,
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.wc_outlined,
//                               color: Colors.orange,
//                               size: 22,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               "School Start Time",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "font2",
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.orange),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Row(
//                         children: [
//                           RaisedButton(
//                             color: Colors.orange,
//                             child: Text(
//                               "Choose start time",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontFamily: "font2",
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () async {
//                               final startDate =
//                                   await _selectedStartTime(context);
//                               print(startDate);
//                               setState(() {
//                                 _finalStartTime = startDate;
//                                 MaterialLocalizations localization =
//                                     MaterialLocalizations.of(context);
//                                 if (_finalStartTime != null) {
//                                   String formattedStartTime = localization
//                                       .formatTimeOfDay(_finalStartTime,
//                                           alwaysUse24HourFormat: false);
//                                   if (formattedStartTime != null) {
//                                     setState(() {
//                                       _schoolStartTime = formattedStartTime;
//                                       _schoolData['startTime'] = _schoolStartTime;
//                                     });
//                                     print("Formatted Start Time");
//                                     print(_schoolStartTime);
//                                   }
//                                 }
//                               });
//                             },
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(
//                             _schoolStartTime == null
//                                 ? "No time selected"
//                                 : _schoolStartTime,
//                             style: TextStyle(
//                               fontSize: 19,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: "font2",
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 24,
//                       ),
//                       Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width - 28,
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.wc_outlined,
//                               color: Colors.orange,
//                               size: 22,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               "School End Time",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "font2",
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.orange),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Row(
//                         children: [
//                           RaisedButton(
//                             color: Colors.orange,
//                             child: Text(
//                               "Choose end time",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontFamily: "font2",
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () async {
//                               final endDate = await _selectedEndTime(context);
//                               print(endDate);
//                               setState(() {
//                                 _finalEndTime = endDate;
//                                 MaterialLocalizations localization =
//                                     MaterialLocalizations.of(context);
//                                 if (_finalEndTime != null) {
//                                   String formattedEndTime = localization
//                                       .formatTimeOfDay(_finalEndTime,
//                                           alwaysUse24HourFormat: false);
//                                   if (formattedEndTime != null) {
//                                     setState(() {
//                                       _schoolEndTime = formattedEndTime;
//                                       _schoolData['endTime'] = _schoolEndTime;
//                                     });
//                                     print("Formatted End Time");
//                                     print(_schoolEndTime);
//                                   }
//                                 }
//                               });
//                             },
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(
//                             _schoolEndTime == null
//                                 ? "No time selected"
//                                 : _schoolEndTime,
//                             style: TextStyle(
//                               fontSize: 19,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: "font2",
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 24,
//                       ),
//                       Container(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width - 120,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(18),
//                           color: Colors.grey[300],
//                           child: TextFormField(
//                             //initialValue: initValues['bookType'],
//                             decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.location_on_sharp,
//                                   color: Colors.orange,
//                                   size: 20,
//                                 ),
//                                 labelText: "School Location",
//                                 labelStyle: TextStyle(
//                                     fontSize: 19,
//                                     fontFamily: "font2",
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.orange),
//                                 border: InputBorder.none),
//                             textInputAction: TextInputAction.next,
//                             focusNode: _schoolDescription,
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Location must not be empty';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) => _schoolData['location'],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 26,
//                       ),
//                       Container(
//                         height: 170,
//                         padding: EdgeInsets.only(
//                           right: 30,
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(18),
//                           color: Colors.grey[300],
//                           child: TextFormField(
//                             //initialValue: initValues['bookDescription'],
//                             decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.description,
//                                   color: Colors.orange,
//                                   size: 20,
//                                 ),
//                                 labelText: "School Description",
//                                 labelStyle: TextStyle(
//                                     fontSize: 19,
//                                     color: Colors.orange,
//                                     fontFamily: "font2"),
//                                 border: InputBorder.none),
//                             maxLines: null,
//                             textInputAction: TextInputAction.done,
//                             keyboardType: TextInputType.multiline,
//                             validator: (value) {
//                               if (value.trim().isEmpty) {
//                                 return 'School Description must not be empty';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) => _schoolData['description'],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//   );
// }
