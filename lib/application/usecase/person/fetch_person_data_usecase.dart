
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/domain/repository/repository.dart';

class FetchPersonDataUsecase {
  final Repository repository;

  const FetchPersonDataUsecase({required this.repository});

  Future<PersonEntity> call(int count) async {
    return await repository.fetchPersonsData(count);
  }
}