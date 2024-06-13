import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';
import 'package:pdax_exam/infrastructure/services/my_dio_services.dart';

class ImplementRemoteDataSource implements RemoteDataSource {
  late MyDioServices dioServices;

  ImplementRemoteDataSource(this.dioServices);

  @override
  Future<PersonEntity> fetchPersonsData(int count) async {
    debugPrint('>>> fetchPersonsData');
    late PersonModel model;

    try {
      final response = await dioServices.getRequest('${constants.apiPersons}$count');
      if (response.statusCode == 200) {
        var mapData = Map<String, dynamic>.from(response.data);
        model = PersonModel.fromJson(mapData);
        return model;
      } else {
        model = response.data;
        return model;
      }
    } catch (e) {
      debugPrint('>>> ERROR $e');
    }
    debugPrint('>>> MODEL $model');
    return model;
  }
}