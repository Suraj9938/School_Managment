import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookScreen extends StatefulWidget {
  static const String routeName = "/staff_book_screen";

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _bookType = FocusNode();
  final _categoryId = FocusNode();
  final _publihser = FocusNode();
  final _publishYear = FocusNode();
  final _ratingNo = FocusNode();
  final _userRating = FocusNode();
  final _isTopGrossing = FocusNode();
  final _bookDescription = FocusNode();
  final _imageUrl = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isInit = true;
  bool _isLoading = false;
  Uint8List images;

  var initValues = {
    'bookName': "",
    'bookImage': "",
    'bookType': "",
    'ISBN': "",
    'publisher': "",
    'publishYear': "",
    'userRating': "",
    'ratingNo': "",
    'bookDescription': "",
    'isTopGrossing': "",
  };

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(_updateImageUrl);
  }

  void _updateImageUrl() {
    if (!_imageUrl.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bookType.dispose();
    _categoryId.dispose();
    _publihser.dispose();
    _publishYear.dispose();
    _ratingNo.dispose();
    _userRating.dispose();
    _isTopGrossing.dispose();
    _bookDescription.dispose();
    _imageUrl.dispose();
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
    // if (_editedBook.id != null) {
    //   try {
    //     await Provider.of<Book>(context, listen: false)
    //         .updateProduct(_editedBook.id, _editedBook);
    //     await showDialog(
    //         context: context,
    //         builder: (ctx) => AlertDialog(
    //           title: Text('Success'),
    //           content: Text("Book Updated Successfully"),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));
    //
    //   } catch (error) {
    //     await showDialog(
    //         context: context,
    //         builder: (ctx) => AlertDialog(
    //           title: Text('Error Occurred'),
    //           content: Text("Something has occurred! Book cannot be added"),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));
    //   }
    // } else {
    //   try {
    //     await Provider.of<Book>(context, listen: false).addBook(_editedBook);
    //     await showDialog(
    //         context: context,
    //         builder: (ctx) => AlertDialog(
    //           title: Text('Success'),
    //           content: Text("Book Added Successfully"),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));
    //   } catch (error) {
    //     await showDialog(
    //         context: context,
    //         builder: (ctx) => AlertDialog(
    //           title: Text('Error Occurred'),
    //           content: Text("Something has occurred! Book cannot be added"),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));
    //   }
    // }
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
  void didChangeDependencies() {
    if (_isInit) {
      final String bookId = ModalRoute.of(context).settings.arguments;
      // if (bookId != null) {
      //   _editedBook =
      //       Provider.of<Book>(context, listen: false).findById(bookId);
      //   initValues = {
      //     'bookName': _editedBook.bookName,
      //     'bookImage': _editedBook.bookImage,
      //     'bookType': _editedBook.bookType,
      //     'categoryId': _editedBook.categoryId.toString(),
      //     'publisher': _editedBook.publisher,
      //     'publishYear': _editedBook.publishYear.toString(),
      //     'userRating': _editedBook.userRating,
      //     'ratingNo': _editedBook.ratingNo,
      //     'bookDescription': _editedBook.bookDescription,
      //     'isTopGrossing': _editedBook.isTopGrossing,
      //   };
      //   _imageUrlController.text = _editedBook.bookImage;
      // }
    }
    _isInit = false;
    super.didChangeDependencies();
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
                                initialValue: initValues['bookName'],
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
                                initialValue: initValues['bookType'],
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
                            initialValue: initValues['publisher'],
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
                            initialValue: initValues['publishYear'],
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
                            initialValue: initValues['ratingNo'],
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
                            initialValue: initValues['userRating'],
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
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(18),
                      child: TextFormField(
                        initialValue: initValues['bookDescription'],
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
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        focusNode: _bookDescription,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_imageUrl);
                        },
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
