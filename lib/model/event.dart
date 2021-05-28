import 'package:flutter/cupertino.dart';

class Event with ChangeNotifier {
  String eventId;
  String eventName;
  String eventDate;
  String eventDay;
  String eventStartTime;
  String eventEndTime;
  String eventDescription;
  String eventImage;

  Event({
    this.eventId,
    this.eventName,
    this.eventDate,
    this.eventDay,
    this.eventStartTime,
    this.eventEndTime,
    this.eventDescription,
    this.eventImage,
  });
}
