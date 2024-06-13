import 'package:pdax_exam/domain/repository/repository.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';

class ImplementRepository implements Repository {
  final RemoteDataSource remoteDataSource;

  const ImplementRepository({required this.remoteDataSource});

  @override
  Future<PersonModel> fetchPersonsData(int itemsLoaded, int itemsPerPage) async {
    return await remoteDataSource.fetchPersonsData(itemsLoaded, itemsPerPage);
  }

}