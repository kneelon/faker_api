
import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final String? status;
  final int? code;
  final int? total;
  final List<DatumEntity>? data;

  const PersonEntity({
    this.status,
    this.code,
    this.total,
    this.data,
  });

  @override
  List<Object?> get props => [
    status,
    code,
    total,
    data,
  ];

}

class DatumEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final DateTime? birthday;
  final Gender? gender;
  final AddressEntity? address;
  final String? website;
  final String? image;

  const DatumEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  @override
  List<Object?> get props => [
    id,
    firstname,
    lastname,
    email,
    phone,
    birthday,
    gender,
    address,
    website,
    image,
  ];
}

class AddressEntity extends Equatable {
  final int? id;
  final String? street;
  final String? streetName;
  final String? buildingNumber;
  final String? city;
  final String? zipcode;
  final String? country;
  final String? county_code;
  final double? latitude;
  final double? longitude;

  const AddressEntity({
    this.id,
    this.street,
    this.streetName,
    this.buildingNumber,
    this.city,
    this.zipcode,
    this.country,
    this.county_code,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
    id,
    street,
    streetName,
    buildingNumber,
    city,
    zipcode,
    country,
    county_code,
    latitude,
    longitude,
  ];
}
enum Gender {
  male,
  female,
  others,
}