import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:pdax_exam/domain/entity/person/person_entity.dart';


class PersonModel extends PersonEntity {
  const PersonModel({
    String status = constants.empty,
    int code = 0,
    int total = 0,
    List<DatumModel> data = const [],
  }) : super(
    status: status,
    code: code,
    total: total,
    data: data,
  );

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    status: json[constants.status],
    code: json[constants.code],
    total: json[constants.total],
    data: List<DatumModel>.from(json[constants.data].map((x) => DatumModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    constants.status: status,
    constants.code: code,
    constants.total: total,
    constants.data: data,
  };
}

class DatumModel extends DatumEntity {
  const DatumModel({
    int id = 0,
    String firstname = constants.empty,
    String lastname = constants.empty,
    String email = constants.empty,
    String phone = constants.empty,
    DateTime? birthday,
    Gender? gender,
    AddressModel? address,
    String website = constants.empty,
    String image = constants.empty,
  }) : super(
    id : id,
    firstname : firstname,
    lastname : lastname,
    email : email,
    phone : phone,
    birthday : birthday,
    //gender : gender,
    address: address,
    website : website,
    image : image,
  );

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
    id: json[constants.id],
    firstname: json[constants.firstname],
    lastname: json[constants.lastname],
    email: json[constants.email],
    phone: json[constants.phone],
    birthday: DateTime.parse(json[constants.birthday]),
    gender: genderValues.map[json[constants.gender]]!,
    address: AddressModel.fromJson(json[constants.address]),
    website: json[constants.website],
    image: json[constants.image],
  );

  Map<String, dynamic> toJson() => {
    constants.id : id,
  constants.firstname : firstname,
  constants.lastname : lastname,
  constants.email : email,
  constants.phone : phone,
  constants.birthday : birthday!.toIso8601String(),
  constants.gender : genderValues.reverse[gender],
  //constants.gender : gender,
  constants.address : address,
  constants.website : website,
  constants.image : image,
  };
}

class AddressModel extends AddressEntity {
  const AddressModel({
    int id = 0,
    String street = constants.empty,
    String streetName = constants.empty,
    String buildingNumber = constants.empty,
    String city = constants.empty,
    String zipcode = constants.empty,
    String country = constants.empty,
    String county_code = constants.empty,
    double latitude = 0,
    double longitude = 0,
  }) : super(
    id : id,
    street : street,
    streetName : streetName,
    buildingNumber : buildingNumber,
    city : city,
    zipcode : zipcode,
    country : country,
    county_code : county_code,
    latitude : latitude,
    longitude : longitude,
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json[constants.id],
    street: json[constants.street],
    streetName: json[constants.streetName],
    buildingNumber: json[constants.buildingNumber],
    city: json[constants.city],
    zipcode: json[constants.zipcode],
    country: json[constants.country],
    county_code: json[constants.county_code],
    latitude: json[constants.latitude]?.toDouble(),
    longitude: json[constants.longitude]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    constants.id : id,
    constants.street : street,
    constants.streetName : streetName,
    constants.buildingNumber : buildingNumber,
    constants.city : city,
    constants.zipcode : zipcode,
    constants.country : country,
    constants.county_code : county_code,
    constants.latitude : latitude,
    constants.longitude : longitude,
  };
}

enum Gender {
  male,
  female,
  others,
}

final genderValues = EnumValues({
  constants.male : Gender.male,
  constants.female : Gender.female,
  constants.others : Gender.others,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
