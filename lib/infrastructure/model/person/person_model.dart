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
    status: json[constants.status],
    code: json[constants.code],
    total: json[constants.total],
    data: List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    constants.status: status,
    constants.code: code,
    constants.total: total,
    constants.data: List<dynamic>.from(data.map((x) => x.toJson())),
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
    id: json[constants.id],
    firstname: json[constants.firstname],
    lastname: json[constants.lastname],
    email: json[constants.email],
    phone: json[constants.phone],
    birthday: DateTime.parse(json[constants.birthday]),
    gender: json[constants.gender],
    address: AddressModel.fromJson(json[constants.address]),
    website: json[constants.website],
    image: json[constants.image],
  );

  Map<String, dynamic> toJson() => {
    constants.id: id,
    constants.firstname: firstname,
    constants.lastname: lastname,
    constants.email: email,
    constants.phone: phone,
    constants.birthday: "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    constants.gender: gender,
    constants.address: address.toJson(),
    constants.website: website,
    constants.image: image,
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
    id: json[constants.id],
    street: json[constants.street],
    streetName: json[constants.streetName],
    buildingNumber: json[constants.buildingNumber],
    city: json[constants.city],
    zipcode: json[constants.zipcode],
    country: json[constants.country],
    countyCode: json[constants.county_code],
    latitude: json[constants.latitude]?.toDouble(),
    longitude: json[constants.longitude]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    constants.id: id,
    constants.street: street,
    constants.streetName: streetName,
    constants.buildingNumber: buildingNumber,
    constants.city: city,
    constants.zipcode: zipcode,
    constants.country: country,
    constants.county_code: countyCode,
    constants.latitude: latitude,
    constants.longitude: longitude,
  };
}
