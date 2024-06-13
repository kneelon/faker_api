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

  // @override
  // Future<PersonEntity> fetchPersonsData(int itemsLoaded, int itemsPerPage) async {
  //   debugPrint('>>> fetchPersonsData');
  //   late PersonModel model;
  //
  //
  //   try {
  //     final response = await dioServices.getRequest('${constants.apiPersons}100');
  //     if (response.statusCode == 200) {
  //       var mapData = Map<String, dynamic>.from(response.data);
  //       model = PersonModel.fromJson(mapData);
  //       int end = (itemsLoaded + itemsPerPage) > model.data!.length
  //         ? model.data!.length
  //         : itemsLoaded + itemsPerPage;
  //        List<DatumEntity> paginatedData = model.data!.sublist(itemsLoaded, end);
  //         debugPrint('>>> paginatedData ${paginatedData.length}');
  //        return PersonEntity(data: paginatedData);
  //       //return PersonModel(data: model.data!.sublist(itemsLoaded, end));
  //
  //     } else {
  //       model = const PersonModel(data: []);
  //       return model;
  //     }
  //   } catch (e) {
  //     debugPrint('>>> ERROR $e');
  //     return const PersonModel(data: []);
  //   }
  // }

  @override
  Future<PersonModel> fetchPersonsData(int itemsLoaded, int itemsPerPage) async {
    debugPrint('>>> fetchPersonsData');
    late PersonModel model;

    try {
      final response = await dioServices.getRequest('${constants.apiPersons}100');
      if (response.statusCode == 200) {
        var mapData = Map<String, dynamic>.from(response.data);
        model = PersonModel.fromJson(mapData);
        int end = (itemsLoaded + itemsPerPage) > model.data.length
            ? model.data.length : itemsLoaded + itemsPerPage;
        //List<DatumModel> paginatedData = model.data!.sublist(itemsLoaded, end);
        List<DatumModel> paginatedData = model.data.sublist(itemsLoaded, end);

        return PersonModel(
            status: 'OK',
            code: 200,
            total: 100,
            data: paginatedData);
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

  // @override
  // Future<PersonEntity> fetchPersonsData() async {
  //   debugPrint('>>> fetchPersonsData');
  //   late PersonModel model;
  //
  //   try {
  //     final response = await dioServices.getRequest('${constants.apiPersons}100');
  //     if (response.statusCode == 200) {
  //       var mapData = Map<String, dynamic>.from(response.data);
  //       model = PersonModel.fromJson(mapData);
  //       return model;
  //     } else {
  //       model = response.data;
  //       return model;
  //     }
  //   } catch (e) {
  //     debugPrint('>>> ERROR $e');
  //   }
  //   debugPrint('>>> MODEL $model');
  //   return model;
  // }
}