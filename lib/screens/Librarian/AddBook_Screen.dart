import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/screens/Librarian/Librarian_OverView_Screen.dart';

class AddBookScreen extends StatefulWidget {
  static const String routeName = "/staff_book_screen";

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _bookType = FocusNode();
  final _publihser = FocusNode();
  final _publishYear = FocusNode();
  final _ratingNo = FocusNode();
  final _userRating = FocusNode();
  final _bookDescription = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isInit = true;
  bool _isLoading = false;
  Uint8List images;

  var _bookData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bookType.dispose();
    _publihser.dispose();
    _publishYear.dispose();
    _ratingNo.dispose();
    _userRating.dispose();
    _bookDescription.dispose();
  }

  //save form and validate
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
      final response = await Provider.of<BookProvider>(context, listen: false)
          .addBook(_bookData, images);
      print("Response");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Success'),
            content: Text("Book was added successfully"),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ).then(
          (value) => Navigator.of(context)
              .pushNamed(LibrarianOverViewScreen.routeName),
        );
      } else if (response.statusCode >= 300 && response.statusCode < 400 ||
          response.statusCode == 500) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error Occured'),
            content: Text("Book addition failed!"),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ).then(
          (value) => Navigator.of(context)
              .pushNamed(LibrarianOverViewScreen.routeName),
        );
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text("Provide Valid Book Credentials and try again!"),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ).then(
          (value) => Navigator.of(context)
              .pushNamed(LibrarianOverViewScreen.routeName),
        );
      }
    } catch (error) {
      throw error;
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Add Books",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "font1",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              _saveForm();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.library_books,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  labelText: "Book Name",
                                  labelStyle: TextStyle(
                                      fontSize: 19, color: Colors.orange),
                                  border: _outlineBorder(),
                                  enabledBorder: _outlineBorder(),
                                  errorBorder: _outlineBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_bookType);
                                },
                                onChanged: (value) =>
                                    _bookData['bookName'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Book Name must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.book,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  labelText: "Book Type",
                                  labelStyle: TextStyle(
                                      fontSize: 19, color: Colors.orange),
                                  border: _outlineBorder(),
                                  enabledBorder: _outlineBorder(),
                                  errorBorder: _outlineBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                focusNode: _bookType,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_publihser);
                                },
                                onChanged: (value) =>
                                    _bookData['bookType'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Book Type must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          height: 132,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: Colors.blueGrey[200],
                          child: RaisedButton(
                            child: images == null && userImage == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_pin,
                                color: Colors.orange,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: "Publisher",
                              labelStyle:
                                  TextStyle(fontSize: 19, color: Colors.orange),
                              border: _outlineBorder(),
                              enabledBorder: _outlineBorder(),
                              errorBorder: _outlineBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _publihser,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_publishYear);
                            },
                            onChanged: (value) =>
                                _bookData['publisher'] = value,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Publisher must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 18,
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: Colors.orange,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: "Publish Year",
                              labelStyle:
                                  TextStyle(fontSize: 19, color: Colors.orange),
                              border: _outlineBorder(),
                              enabledBorder: _outlineBorder(),
                              errorBorder: _outlineBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _publishYear,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_ratingNo);
                            },
                            onChanged: (value) =>
                                _bookData['publishYear'] = value,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Publish Year must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.rate_review,
                                color: Colors.orange,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: "Rating No",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.orange),
                              border: _outlineBorder(),
                              enabledBorder: _outlineBorder(),
                              errorBorder: _outlineBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _ratingNo,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_userRating);
                            },
                            onChanged: (value) => _bookData['ratingNo'] = value,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Rating No must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 18,
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.aspect_ratio,
                                color: Colors.orange,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: "User Rating",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.orange),
                              border: _outlineBorder(),
                              enabledBorder: _outlineBorder(),
                              errorBorder: _outlineBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _userRating,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_bookDescription);
                            },
                            onChanged: (value) =>
                                _bookData['userRating'] = value,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'User Rating must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(18),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.library_books,
                            color: Colors.orange,
                            size: 20,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelText: "Book Description",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.orange),
                          border: _outlineBorder(),
                          enabledBorder: _outlineBorder(),
                          errorBorder: _outlineBorder(),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        focusNode: _bookDescription,
                        onChanged: (value) =>
                            _bookData['bookDescription'] = value,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Book Description must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
