
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';

abstract class RemoteDataSource {

  Future<PersonModel> fetchPersonsData(int itemsLoaded, int itemsPerPage);
}