import 'package:pdax_exam/domain/repository/repository.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';

class FetchPersonDataUsecase {
  final Repository repository;

  const FetchPersonDataUsecase({required this.repository});

  Future<PersonModel> call(int itemsLoaded, int itemsPerPage) async {
    return await repository.fetchPersonsData(itemsLoaded, itemsPerPage);
  }
}