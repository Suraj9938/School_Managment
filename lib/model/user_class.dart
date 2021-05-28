import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';

class UserClass {
  final String userClassId;
  final List<Auth> users;
  final Class classes;

  UserClass({
    this.userClassId,
    this.users,
    this.classes,
  });
}
