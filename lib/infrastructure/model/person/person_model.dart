import 'package:pdax_exam/presentation/utility/constants.dart' as constants;

class PersonModel {
  String status;
  int code;
  int total;
  List<DatumModel> data;

  PersonModel({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    status: json["status"],
    code: json["code"],
    total: json["total"],
    data: List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumModel {
  int id;
  String firstname;
  String lastname;
  String email;
  String phone;
  DateTime birthday;
  String gender;
  AddressModel address;
  String website;
  String image;

  DatumModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.website,
    required this.image,
  });

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    birthday: DateTime.parse(json["birthday"]),
    gender: json[constants.gender],
    address: AddressModel.fromJson(json["address"]),
    website: json["website"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "address": address.toJson(),
    "website": website,
    "image": image,
  };
}

class AddressModel {
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countyCode;
  double latitude;
  double longitude;

  AddressModel({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countyCode,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    street: json["street"],
    streetName: json["streetName"],
    buildingNumber: json["buildingNumber"],
    city: json["city"],
    zipcode: json["zipcode"],
    country: json["country"],
    countyCode: json["county_code"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "street": street,
    "streetName": streetName,
    "buildingNumber": buildingNumber,
    "city": city,
    "zipcode": zipcode,
    "country": country,
    "county_code": countyCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}
