
import 'package:pdax_exam/domain/entity/person/person_entity.dart';

abstract class RemoteDataSource {

  Future<PersonEntity> fetchPersonsData(int count);
}