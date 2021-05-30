import 'package:flutter/material.dart';

class OrderBookDetails extends StatelessWidget {
  final String bookName;
  final String bookImage;
  final String publisher;
  final String ratingNo;

  OrderBookDetails(
    this.bookName,
    this.bookImage,
    this.publisher,
    this.ratingNo,
  );

  @override
  Widget build(BuildContext context) {
    print("From Order Book Screen");
    print(bookName);
    print(bookImage);
    print(publisher);
    print(ratingNo);
    return Card(
      shadowColor: Colors.white,
      margin: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              child: Padding(
                padding: EdgeInsets.all(0),
                child: ListTile(
                  leading: Image.network(
                    bookImage,
                    height: 50,
                    width: 46,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    bookName,
                    style: TextStyle(
                      fontFamily: "font1",
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: 5, top: 2),
                    child: Text(
                      publisher,
                      style: TextStyle(
                        fontFamily: "font1",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  trailing: Text(
                    ratingNo,
                    style: TextStyle(
                      fontFamily: "font1",
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
