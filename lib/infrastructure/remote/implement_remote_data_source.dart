
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';
import 'package:pdax_exam/infrastructure/services/my_dio_services.dart';

class ImplementRemoteDataSource implements RemoteDataSource {
  late MyDioServices dioServices;

  ImplementRemoteDataSource(this.dioServices);
}