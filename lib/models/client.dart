import 'package:flutter/foundation.dart';

class Client {
  final String id;
  final String firstName;
  final String lastName;
  final String address1;
  final String address2;
  final String address3;
  final String cedula;

  Client({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.address1,
    this.address2,
    this.address3,
    @required this.cedula,
  });
}