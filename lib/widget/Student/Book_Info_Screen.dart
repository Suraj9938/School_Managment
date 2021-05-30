import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/book.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/provider/user_book_provider.dart';
import 'package:school_management/screens/Student/Library_Books_Screen.dart';

class BookInfoScreen extends StatefulWidget {
  static const routeName = "/book_info";

  Auth _currentUser;
  String _selectedBook;

  @override
  _BookInfoScreenState createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {
  Auth _user;
  String bookId;
  bool _isInit = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = false;
      });
      Provider.of<AuthProvider>(context, listen: false)
          .setFetchedUsersData()
          .then((value) {
        _user = Provider.of<AuthProvider>(context, listen: false).LoggedInUser;
        widget._currentUser = _user;
        print("User Id");
        print(widget._currentUser.userId);
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<BookProvider>(context, listen: false)
          .setFetchedBooksData()
          .then((value) {
        widget._selectedBook = bookId;
        print("widget._selectedBook");
        print(widget._selectedBook);
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final books = Provider.of<BookProvider>(context).findById(id);
    bookId = id;

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                Container(
                  foregroundDecoration: BoxDecoration(color: Colors.black26),
                  height: 400,
                  width: double.infinity,
                  child: Image.network(
                    books.bookImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 275),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                          books.bookName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font1",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 16.0,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  books.ratingNo,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontFamily: "font1",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Text(
                              books.userRating,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: "font1",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 18,
                                top: 20,
                                bottom: 10,
                                right: 10,
                              ),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "About Book",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21.0,
                                      fontFamily: "font1",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons
                                                      .supervised_user_circle_rounded,
                                                  color: Colors.orange,
                                                  size: 19,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Book Publisher - ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.orange,
                                                    fontSize: 19,
                                                    fontFamily: "font2",
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  books.publisher,
                                                  style: TextStyle(
                                                    fontFamily: "font2",
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.date_range_outlined,
                                                  color: Colors.orange,
                                                  size: 19,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Published Date - ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.orange,
                                                    fontSize: 19,
                                                    fontFamily: "font2",
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  books.publishYear,
                                                  style: TextStyle(
                                                    fontFamily: "font2",
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.book,
                                                  color: Colors.orange,
                                                  size: 19,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Book Type - ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.orange,
                                                    fontSize: 19,
                                                    fontFamily: "font2",
                                                  ),
                                                ),
                                                Text(
                                                  books.bookType,
                                                  style: TextStyle(
                                                    fontFamily: "font2",
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30.0),
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      fontFamily: "font1",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: Text(
                                      books.bookDescription,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        fontFamily: "font2",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      color: Colors.orange,
                                      textColor: Colors.white,
                                      child: Text(
                                        "Book Now",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontFamily: "font1",
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16.0,
                                        horizontal: 32.0,
                                      ),
                                      onPressed: () async {
                                        try {
                                          final response = await Provider.of<
                                                      UserBookProvider>(context,
                                                  listen: false)
                                              .addUserBook(widget._currentUser,
                                                  widget._selectedBook);
                                          if (response.statusCode == 200 ||
                                              response.statusCode == 201) {
                                            return showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                      title: Text('Success'),
                                                      content: Text(
                                                          "Book was ordered successfully"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text('Okay'),
                                                          onPressed: () {
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    )).then(
                                              (value) => Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      LibraryBooksScreen
                                                          .routeName),
                                            );
                                          } else {
                                            return showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                      title: Text(
                                                          'An Error Occurred!'),
                                                      content: Text(
                                                          "Book could not be ordered!"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text('Okay'),
                                                          onPressed: () {
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    )).then(
                                              (value) => Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      LibraryBooksScreen
                                                          .routeName),
                                            );
                                          }
                                        } catch (error) {
                                          throw (error);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
