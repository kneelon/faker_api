
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/domain/repository/repository.dart';
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';

class ImplementRepository implements Repository {
  final RemoteDataSource remoteDataSource;

  const ImplementRepository({required this.remoteDataSource});

  @override
  Future<PersonEntity> fetchPersonsData(int count) async {
    return await remoteDataSource.fetchPersonsData(count);
  }

}