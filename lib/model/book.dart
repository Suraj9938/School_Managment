import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier {
  final String bookId;
  final String bookName;
  final String bookType;
  final String bookImage;
  final String publisher;
  final String publishYear;
  final String ratingNo;
  final String userRating;
  final String bookDescription;

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
