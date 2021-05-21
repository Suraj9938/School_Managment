import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/book.dart';
import 'package:school_management/widget/Student/Book_Info_Screen.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedBooks = Provider.of<Book>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BookInfoScreen.routeName,
                arguments: loadedBooks.bookId);
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  height: 142,
                  width: 125,
                  color: Colors.grey,
                  child: Image.network(
                    loadedBooks.bookImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(22),
                    topRight: Radius.circular(22)),
                child: Container(
                  color: Colors.white,
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2 + 15,
                  padding: EdgeInsets.only(
                    top: 4,
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loadedBooks.bookName,
                        style: TextStyle(
                          fontFamily: "font2",
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.person_pin,
                              color: Colors.black54,
                              size: 24,
                            ),
                          ),
                          Text(
                            loadedBooks.publisher,
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
