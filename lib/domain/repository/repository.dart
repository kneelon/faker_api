import 'package:pdax_exam/infrastructure/model/person/person_model.dart';

abstract class Repository {
  Future<PersonModel> fetchPersonsData(int itemsLoaded, int itemsPerPage);
}