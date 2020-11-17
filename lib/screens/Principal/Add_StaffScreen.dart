import 'package:flutter/material.dart';

class AddStaffScreen extends StatefulWidget {
  @override
  _AddStaffScreenState createState() => _AddStaffScreenState();
}

enum Gender { Male, Female, Others }

class _AddStaffScreenState extends State<AddStaffScreen> {
  final _staffAge = FocusNode();
  final _staffMobileNo = FocusNode();
  final _staffAddress = FocusNode();
  final _staffEmail = FocusNode();
  final _staffPassword = FocusNode();
  final _staffReEnterPassword = FocusNode();

  Gender _gender = Gender.Male;
  var _staffType = ['Teacher', 'Librarian'];
  var _currentStaffSelected = 'Teacher';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _staffAge.dispose();
    _staffMobileNo.dispose();
    _staffAddress.dispose();
    _staffEmail.dispose();
    _staffPassword.dispose();
    _staffReEnterPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Staff",
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
      body: SafeArea(
        child: Form(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 18),
                child: Text(
                  "Staff Information",
                  style: TextStyle(
                    fontFamily: "font2",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 + 15,
                            padding: EdgeInsets.only(left: 13),
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[300],
                              child: TextFormField(
                                //initialValue: initValues['bookType'],
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    labelText: "Staff Name",
                                    labelStyle: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "font2",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange),
                                    border: InputBorder.none),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_staffAddress);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Staff Name must not be empty';
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
                            width: MediaQuery.of(context).size.width / 2 + 15,
                            padding: EdgeInsets.only(left: 13),
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
                                    labelText: "Staff Address",
                                    labelStyle: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "font2",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange),
                                    border: InputBorder.none),
                                textInputAction: TextInputAction.done,
                                focusNode: _staffAddress,
                                // onFieldSubmitted: (_) {
                                //   FocusScope.of(context).requestFocus(_categoryId);
                                // },
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
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: Colors.blueGrey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera,
                                color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
                          Icons.wc_outlined,
                          color: Colors.orange,
                          size: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Staff Gender",
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 4,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width - 60,
                          child: Row(
                            children: [
                              Radio(
                                value: Gender.Male,
                                groupValue: _gender,
                                activeColor: Colors.blueGrey,
                                onChanged: (value) => {},
                              ),
                              Text("Male"),
                              Radio(
                                value: Gender.Female,
                                groupValue: _gender,
                                activeColor: Colors.blueGrey,
                                onChanged: (value) => {},
                              ),
                              Text("Female"),
                              Radio(
                                value: Gender.Others,
                                groupValue: _gender,
                                activeColor: Colors.blueGrey,
                                onChanged: (value) => {},
                              ),
                              Text("Others"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.orange,
                          size: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Select User Type",
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: DropdownButton<String>(
                                items:
                                    _staffType.map((String dropDownStringItem) {
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
                                    this._currentStaffSelected = newValueSelected;
                                  });
                                },
                                value: _currentStaffSelected,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: EdgeInsets.only(left: 13),
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey[300],
                          child: TextFormField(
                            //initialValue: initValues['bookType'],
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                labelText: "Staff Age",
                                labelStyle: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                                border: InputBorder.none),
                            textInputAction: TextInputAction.next,
                            focusNode: _staffAge,
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_staffMobileNo);
                            },
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
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2 + 26,
                        padding: EdgeInsets.only(left: 13),
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey[300],
                          child: TextFormField(
                            //initialValue: initValues['bookType'],
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mobile_friendly,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                labelText: "Mobile Number",
                                labelStyle: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "font2",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                                border: InputBorder.none),
                            textInputAction: TextInputAction.next,
                            focusNode: _staffMobileNo,
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_staffEmail);
                            },
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
                    height: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 18),
                child: Text(
                  "Staff Mailing Address",
                  style: TextStyle(
                    fontFamily: "font2",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 70,
                      padding: EdgeInsets.only(left: 13),
                      child: Material(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey[300],
                        child: TextFormField(
                          //initialValue: initValues['bookType'],
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.quick_contacts_mail,
                                color: Colors.orange,
                                size: 20,
                              ),
                              labelText: "Staff Email",
                              labelStyle: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                              border: InputBorder.none),
                          focusNode: _staffEmail,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_staffPassword);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Staff Email must not be empty';
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
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 70,
                      padding: EdgeInsets.only(left: 13),
                      child: Material(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey[300],
                        child: TextFormField(
                          //initialValue: initValues['bookType'],
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.verified_user_rounded,
                                color: Colors.orange,
                                size: 20,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                              border: InputBorder.none),
                          textInputAction: TextInputAction.next,
                          focusNode: _staffPassword,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_staffReEnterPassword);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password must not be empty';
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
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 70,
                      padding: EdgeInsets.only(left: 13),
                      child: Material(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey[300],
                        child: TextFormField(
                          //initialValue: initValues['bookType'],
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.verified_user_rounded,
                                color: Colors.orange,
                                size: 20,
                              ),
                              labelText: "Re-enter Password",
                              labelStyle: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                              border: InputBorder.none),
                          textInputAction: TextInputAction.done,
                          focusNode: _staffReEnterPassword,
                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context).requestFocus(_staffAddress);
                          // },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Staff Name must not be empty';
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
                      height: 30,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 12,
              // ),
              // Row(
              //   children: <Widget>[
              //     SizedBox(
              //       width: 14,
              //     ),
              //     Container(
              //       height: 60,
              //       width: MediaQuery.of(context).size.width / 2 - 22,
              //       child: Material(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey[300],
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //               prefixIcon: Icon(
              //                 Icons.library_books,
              //                 color: Colors.orange,
              //                 size: 20,
              //               ),
              //               labelText: "Teacher Name",
              //               labelStyle:
              //                   TextStyle(fontSize: 20, color: Colors.orange),
              //               border: InputBorder.none),
              //           textInputAction: TextInputAction.next,
              //           onFieldSubmitted: (_) {
              //             //FocusScope.of(context).requestFocus(_bookType);
              //           },
              //           validator: (value) {
              //             if (value.isEmpty) {
              //               return 'Book Name must not be empty';
              //             }
              //             return null;
              //           },
              //           // onSaved: (value) {
              //           //   _editedBook = BookProvider(
              //           //     id: _editedBook.id,
              //           //     bookName: value.trimLeft().trim(),
              //           //     bookImage: _editedBook.bookImage,
              //           //     bookType: _editedBook.bookType,
              //           //     categoryId: _editedBook.categoryId,
              //           //     publisher: _editedBook.publisher,
              //           //     publishYear: _editedBook.publishYear,
              //           //     userRating: _editedBook.userRating,
              //           //     ratingNo: _editedBook.ratingNo,
              //           //     bookDescription: _editedBook.bookDescription,
              //           //     isTopGrossing: _editedBook.isTopGrossing,
              //           //   );
              //           // },
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Container(
              //       height: 60,
              //       width: MediaQuery.of(context).size.width / 2 - 28,
              //       child: Material(
              //         borderRadius: BorderRadius.circular(18),
              //         color: Colors.grey[300],
              //         child: TextFormField(
              //           //initialValue: initValues['bookType'],
              //           decoration: InputDecoration(
              //               prefixIcon: Icon(
              //                 Icons.book,
              //                 color: Colors.orange,
              //                 size: 20,
              //               ),
              //               labelText: "Book Type",
              //               labelStyle:
              //                   TextStyle(fontSize: 20, color: Colors.orange),
              //               border: InputBorder.none),
              //           textInputAction: TextInputAction.next,
              //           //focusNode: _bookType,
              //           onFieldSubmitted: (_) {
              //             //FocusScope.of(context).requestFocus(_categoryId);
              //           },
              //           validator: (value) {
              //             if (value.isEmpty) {
              //               return 'Book Type must not be empty';
              //             }
              //             return null;
              //           },
              //           // onSaved: (value) {
              //           //   _editedBook = BookProvider(
              //           //     id: _editedBook.id,
              //           //     bookName: _editedBook.bookName,
              //           //     bookImage: _editedBook.bookImage,
              //           //     bookType: value.trimLeft().trim(),
              //           //     categoryId: _editedBook.categoryId,
              //           //     publisher: _editedBook.publisher,
              //           //     publishYear: _editedBook.publishYear,
              //           //     userRating: _editedBook.userRating,
              //           //     ratingNo: _editedBook.ratingNo,
              //           //     bookDescription: _editedBook.bookDescription,
              //           //     isTopGrossing: _editedBook.isTopGrossing,
              //           //   );
              //           // },
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 14,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 22,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['categoryId'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.confirmation_number,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Category Id",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       keyboardType: TextInputType.number,
//                       focusNode: _categoryId,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context).requestFocus(_publihser);
//                       },
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Category Id must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: value.trimLeft().trim(),
//                           publisher: _editedBook.publisher,
//                           publishYear: _editedBook.publishYear,
//                           userRating: _editedBook.userRating,
//                           ratingNo: _editedBook.ratingNo,
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: _editedBook.isTopGrossing,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 28,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['publisher'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.person_pin,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Publisher",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       focusNode: _publihser,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context).requestFocus(_publishYear);
//                       },
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Publisher must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: _editedBook.categoryId,
//                           publisher: value.trimLeft().trim(),
//                           publishYear: _editedBook.publishYear,
//                           userRating: _editedBook.userRating,
//                           ratingNo: _editedBook.ratingNo,
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: _editedBook.isTopGrossing,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 14,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 22,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['publishYear'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.date_range,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Publish Year",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       focusNode: _publishYear,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context).requestFocus(_ratingNo);
//                       },
//                       validator: (value) {
//                         if (value.trim().isEmpty) {
//                           return 'Publish Year must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: _editedBook.categoryId,
//                           publisher: _editedBook.publisher,
//                           publishYear: value.trimLeft().trim(),
//                           userRating: _editedBook.userRating,
//                           ratingNo: _editedBook.ratingNo,
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: _editedBook.isTopGrossing,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 28,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['ratingNo'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.rate_review,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Rating No",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       focusNode: _ratingNo,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context).requestFocus(_userRating);
//                       },
//                       validator: (value) {
//                         if (value.trim().isEmpty) {
//                           return 'Rating No must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: _editedBook.categoryId,
//                           publisher: _editedBook.publisher,
//                           publishYear: _editedBook.publishYear,
//                           userRating: _editedBook.userRating,
//                           ratingNo: value.trimLeft().trim(),
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: _editedBook.isTopGrossing,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 14,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 22,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['userRating'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.aspect_ratio,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "User Rating",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       focusNode: _userRating,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context)
//                             .requestFocus(_isTopGrossing);
//                       },
//                       validator: (value) {
//                         if (value.trim().isEmpty) {
//                           return 'Publish Year must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: _editedBook.categoryId,
//                           publisher: _editedBook.publisher,
//                           publishYear: _editedBook.publishYear,
//                           userRating: value.trimLeft().trim(),
//                           ratingNo: _editedBook.ratingNo,
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: _editedBook.isTopGrossing,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width / 2 - 28,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       initialValue: initValues['isTopGrossing'],
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.whatshot,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Is Grossing?",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.next,
//                       focusNode: _isTopGrossing,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context)
//                             .requestFocus(_bookDescription);
//                       },
//                       validator: (value) {
//                         if (value.trim().isEmpty) {
//                           return 'Rating No must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _editedBook = BookProvider(
//                           id: _editedBook.id,
//                           bookName: _editedBook.bookName,
//                           bookImage: _editedBook.bookImage,
//                           bookType: _editedBook.bookType,
//                           categoryId: _editedBook.categoryId,
//                           publisher: _editedBook.publisher,
//                           publishYear: _editedBook.publishYear,
//                           userRating: _editedBook.userRating,
//                           ratingNo: _editedBook.ratingNo,
//                           bookDescription: _editedBook.bookDescription,
//                           isTopGrossing: value.trimLeft().trim(),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
// //            Container(
// //              height: 70,
// //              padding: EdgeInsets.only(left: 16, right: 16),
// //              child: Material(
// //                borderRadius: BorderRadius.circular(18),
// //                color: Colors.grey[300],
// //                child: TextFormField(
// //                  decoration: InputDecoration(
// //                      prefixIcon: Icon(
// //                        Icons.library_books,
// //                        color: Colors.orange,
// //                        size: 20,
// //                      ),
// //                      labelText: "User Rating",
// //                      labelStyle: TextStyle(fontSize: 20, color: Colors.orange),
// //                      border: InputBorder.none),
// //                  textInputAction: TextInputAction.next,
// //                  focusNode: _userRating,
// //                  onFieldSubmitted: (_) {
// //                    FocusScope.of(context).requestFocus(_bookDescription);
// //                  },
// //                  validator: (value) {
// //                    if(value.trim().isEmpty) {
// //                      return 'User Rating must not be empty';
// //                    }
// //                    return null;
// //                  },
// //                  onSaved: (value) {
// //                    _editedBook = BookProvider(
// //                      id: _editedBook.id,
// //                      bookName: _editedBook.bookName,
// //                      bookImage: _editedBook.bookImage,
// //                      bookType: _editedBook.bookType,
// //                      ISBN: _editedBook.ISBN,
// //                      publisher: _editedBook.publisher,
// //                      publishYear: _editedBook.publishYear,
// //                      userRating: value,
// //                      ratingNo: _editedBook.ratingNo,
// //                      bookDescription: _editedBook.bookDescription,
// //                    );
// //                  },
// //                ),
// //              ),
// //            ),
// //            SizedBox(
// //              height: 20,
// //            ),
//             Container(
//               height: 130,
//               padding: EdgeInsets.only(left: 16, right: 16),
//               child: Material(
//                 borderRadius: BorderRadius.circular(18),
//                 color: Colors.grey[300],
//                 child: Padding(
//                   padding: EdgeInsets.only(bottom: 70),
//                   child: TextFormField(
//                     initialValue: initValues['bookDescription'],
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.library_books,
//                           color: Colors.orange,
//                           size: 20,
//                         ),
//                         labelText: "Book Description",
//                         labelStyle:
//                         TextStyle(fontSize: 20, color: Colors.orange),
//                         border: InputBorder.none),
//                     maxLines: 5,
//                     keyboardType: TextInputType.multiline,
//                     focusNode: _bookDescription,
//                     onFieldSubmitted: (_) {
//                       FocusScope.of(context).requestFocus(_imageUrl);
//                     },
//                     validator: (value) {
//                       if (value.trim().isEmpty) {
//                         return 'Book Description must not be empty';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _editedBook = BookProvider(
//                         id: _editedBook.id,
//                         bookName: _editedBook.bookName,
//                         bookImage: _editedBook.bookImage,
//                         bookType: _editedBook.bookType,
//                         categoryId: _editedBook.categoryId,
//                         publisher: _editedBook.publisher,
//                         publishYear: _editedBook.publishYear,
//                         userRating: _editedBook.userRating,
//                         ratingNo: _editedBook.ratingNo,
//                         bookDescription: value.trimLeft().trim(),
//                         isTopGrossing: _editedBook.isTopGrossing,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   width: 118,
//                   height: 90,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: _imageUrlController.text.isEmpty
//                       ? Center(child: Text("Insert a URL"))
//                       : FittedBox(
//                     child: Image.network(
//                       _imageUrlController.text,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width - 168,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.grey[300],
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.insert_link,
//                             color: Colors.orange,
//                             size: 20,
//                           ),
//                           labelText: "Image Url",
//                           labelStyle:
//                           TextStyle(fontSize: 20, color: Colors.orange),
//                           border: InputBorder.none),
//                       textInputAction: TextInputAction.done,
//                       keyboardType: TextInputType.url,
//                       focusNode: _imageUrl,
//                       controller: _imageUrlController,
//                       validator: (value) {
//                         if (value.trim().isEmpty) {
//                           return 'Image Url must not be empty';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//
            ],
          ),
        ),
      ),
    );
  }
}
