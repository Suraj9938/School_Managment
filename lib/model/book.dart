import 'package:flutter/cupertino.dart';
import 'package:school_management/model/auth.dart';

class Book with ChangeNotifier {
  String bookId,
      bookName,
      bookType,
      bookImage,
      publisher,
      publishYear,
      ratingNo,
      userRating,
      bookDescription;

  Book({
    this.bookId,
    this.bookName,
    this.bookType,
    this.bookImage,
    this.publisher,
    this.publishYear,
    this.ratingNo,
    this.userRating,
    this.bookDescription,
  });
}

class UserBook with ChangeNotifier {
  Auth user;
  Book books;

  UserBook({this.user, this.books});
}
