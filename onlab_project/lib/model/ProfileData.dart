import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileData {
  String key;
  String email, firstName, lastName, postalCode, city, streetAndNum, other, countryCode, tel, userId;

  ProfileData({
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.postalCode,
    @required this.city,
    @required this.streetAndNum,
    @required this.other,
    @required this.countryCode,
    @required this.tel,
    userId,
});

  ProfileData.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        userId = snapshot.value["userId"],
        email = snapshot.value["email"],
        firstName = snapshot.value["firstName"],
        lastName = snapshot.value["lastName"],
        postalCode = snapshot.value["postalCode"],
        city = snapshot.value["city"],
        streetAndNum = snapshot.value["streetAndNum"],
        other = snapshot.value["other"],
        countryCode = snapshot.value["countryCode"],
        tel = snapshot.value["tel"];

  toJson() {
    return {
      "userId": userId,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "postalCode": postalCode,
      "city": city,
      "streetAndNum": streetAndNum,
      "other": other,
      "countryCode": countryCode,
      "tel": tel,
    };
  }
}