import 'package:bloc/bloc.dart';
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:equatable/equatable.dart';
import 'package:pdax_exam/application/usecase/person/fetch_person_data_usecase.dart';
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/presentation/widgets/alert_dialog/new_alert_dialog.dart';

part 'fetch_person_state.dart';

class FetchPersonCubit extends Cubit<FetchPersonState> {
  final FetchPersonDataUsecase fetchPersonsDataUsecase;

  FetchPersonCubit({
    required this.fetchPersonsDataUsecase,
  }) : super(FetchPersonInitial());

  Future<void> fetchPersonsDataCubit(context, {required int count}) async {
    emit(FetchPersonLoading());

    try {
      final result = await fetchPersonsDataUsecase.call(count);
      emit(FetchPersonSuccess(persons: result.data!));
    } catch (e) {
      emit(FetchPersonFailure());
      dialogErrorDone(
        context,
        constants.errorData,
        '$e',
        () {},
      );
    }
  }
}
