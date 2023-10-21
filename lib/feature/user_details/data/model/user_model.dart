class UserModelData {
  String? name;
  String? email;
  String? phoneNumber;
  String? landMark;
  String? city;
  String? address;
  String? logitude;
  String? latitude;

  UserModelData(
      {this.name,
      this.email,
      this.phoneNumber,
      this.landMark,
      this.city,
      this.address,
      this.logitude,
      this.latitude});

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
        "landMark": landMark
      };
}
