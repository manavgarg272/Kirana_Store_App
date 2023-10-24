import 'package:geocoding/geocoding.dart';

class UserModelData {
  String? name;
  String? email;
  String? phoneNumber;
  String? landMark;
  String? city;
  String? address;
  double? logitude;
  double? latitude;
  Placemark? placeMark;
  String? userId;
  bool? locationPermission;
  UserModelData(
      {this.name,
      this.email,
      this.phoneNumber,
      this.landMark,
      this.city,
      this.userId,
      this.address,
      this.logitude,
      this.latitude,
      this.locationPermission,
      this.placeMark});

  factory UserModelData.fromJson(Map<String, dynamic> map) {
    return UserModelData(
      name: map["name"],
      email: map["email"],
      phoneNumber: map["phoneNumber"],
      landMark: map["landMark"],
      city: map["city"],
      address: map["address"],
      logitude: map["longitude"],
      latitude: map["latitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "latitude": latitude,
        "logitude": logitude,
        "address": address,
        "city": city,
        "landMark": landMark,
        "userId": userId,
        "placeMark": placeMark!.toJson(),
        "locationPermission": locationPermission
      };
}
