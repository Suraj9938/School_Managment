import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookInfoScreen extends StatefulWidget {
  static const routeName = "/book_info";

  @override
  _BookInfoScreenState createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {
  bool _listen = false;

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context).settings.arguments as String;
    // final books = Provider.of<Book>(context).findById(id);
    // final books1 = Provider.of<Books>(context, listen: _listen);
    // final auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      //backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            width: double.infinity,
            child: Image.asset(
              "assets/images/book.png",
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
                SizedBox(height: 285),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    "Information Technology",
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
                            "89256 ratings",
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
                        "4.7",
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
                                            "Suraj",
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
                                            "2018",
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
                                            "Information Technology",
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
                                "Best Information Technlogy Till Date asfa aso fab sjfbas oaskfb asj bfkjasbasf.",
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
                                    borderRadius: BorderRadius.circular(30.0)),
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
                                onPressed: () {
                                  // String dateTime = DateTime.now().toString();
                                  // print(dateTime);
                                  // books1.addToBook(
                                  //   dateTime,
                                  //   books.bookName,
                                  //   books.publisher,
                                  //   books.bookImage,
                                  //   books.userRating,
                                  // );
                                  // Scaffold.of(context).removeCurrentSnackBar();
                                  // Scaffold.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     backgroundColor:
                                  //         Theme.of(context).primaryColor,
                                  //     content: Text(
                                  //       "Added to Ordered Books",
                                  //     ),
                                  //     duration: Duration(seconds: 3),
                                  //     action: SnackBarAction(
                                  //       label: "UNDO",
                                  //       textColor: Colors.white,
                                  //       onPressed: () {},
                                  //     ),
                                  //   ),
                                  // );
                                },
                                splashColor: Colors.lime,
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
