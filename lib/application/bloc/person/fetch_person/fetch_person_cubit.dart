import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pdax_exam/application/usecase/person/fetch_person_data_usecase.dart';
import 'package:pdax_exam/domain/entity/person/person_entity.dart';

part 'fetch_person_state.dart';

class FetchPersonCubit extends Cubit<FetchPersonState> {
  final FetchPersonDataUsecase fetchPersonsDataUsecase;

  FetchPersonCubit({
    required this.fetchPersonsDataUsecase,
  }) : super(FetchPersonInitial());

  Future<void> fetchPersonsDataCubit(context, {required int count}) async {
    emit(FetchPersonLoading());

    try {

    } catch (e) {

    }
  }
}
