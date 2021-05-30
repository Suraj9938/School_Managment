import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/provider/user_book_provider.dart';
import 'package:school_management/widget/Student/Order_Book_Details.dart';

class OrderBookScreen extends StatefulWidget {
  static const routeName = "/order_book";

  @override
  _OrderBookScreenState createState() => _OrderBookScreenState();
}

class _OrderBookScreenState extends State<OrderBookScreen> {
  bool _isInit = false;
  bool _isLoading = false;
  Auth user;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      user = Provider.of<AuthProvider>(context, listen: false).LoggedInUser;
      Provider.of<UserBookProvider>(context, listen: false)
          .setFetchUserBook(user)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ordered Books",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<UserBookProvider>(
              builder: (ctx, userBook, _) {
                return ListView.builder(
                  itemBuilder: (ctx, index) => OrderBookDetails(
                    userBook.userBooks[index].books.bookName,
                    userBook.userBooks[index].books.bookImage,
                    userBook.userBooks[index].books.publisher,
                    userBook.userBooks[index].books.ratingNo,
                  ),
                  itemCount: userBook.userBooks.length,
                );
              },
            ),
    );
  }
}
