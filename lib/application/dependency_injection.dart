import 'package:get_it/get_it.dart';
import 'package:pdax_exam/application/bloc/person/fetch_person/fetch_person_cubit.dart';
import 'package:pdax_exam/application/usecase/person/fetch_person_data_usecase.dart';
import 'package:pdax_exam/domain/repository/repository.dart';
import 'package:pdax_exam/infrastructure/implement_repository/implement_repository.dart';
import 'package:pdax_exam/infrastructure/remote/implement_remote_data_source.dart';
import 'package:pdax_exam/infrastructure/remote/remote_data_source.dart';
import 'package:pdax_exam/infrastructure/services/my_dio_services.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory<FetchPersonCubit>(() =>
    FetchPersonCubit(fetchPersonsDataUsecase: sl.call()));
  sl.registerLazySingleton<FetchPersonDataUsecase>(() => FetchPersonDataUsecase(repository: sl.call()));

  //RemoteDataSource initialization
  sl.registerLazySingleton<RemoteDataSource>(() => ImplementRemoteDataSource(sl.call()));

  //Repository initialization
  sl.registerLazySingleton<Repository>(() => ImplementRepository(remoteDataSource: sl.call()));

  //External
  MyDioServices dioServices = MyDioServices();
  sl.registerLazySingleton(() => dioServices);
}