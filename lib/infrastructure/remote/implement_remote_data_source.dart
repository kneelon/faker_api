import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:flutter/foundation.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';
import 'package:pdax_exam/infrastructure/services/my_dio_services.dart';

class ImplementRemoteDataSource implements RemoteDataSource {
  late MyDioServices dioServices;

  ImplementRemoteDataSource(this.dioServices);

  @override
  Future<PersonModel> fetchPersonsData(int itemsLoaded, int itemsPerPage) async {
    late PersonModel model;

    try {
      final response = await dioServices.getRequest('${constants.apiPersons}100');
      if (response.statusCode == 200) {
        var mapData = Map<String, dynamic>.from(response.data);
        model = PersonModel.fromJson(mapData);
        int end = (itemsLoaded + itemsPerPage) > model.data.length
            ? model.data.length : itemsLoaded + itemsPerPage;
        List<DatumModel> paginatedData = model.data.sublist(itemsLoaded, end);

        return PersonModel(
            status: constants.capsOk,
            code: 200,
            total: 100,
            data: paginatedData);
      } else {
        model = response.data;
        return model;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return model;
  }
}