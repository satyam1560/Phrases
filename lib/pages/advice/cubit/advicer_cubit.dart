import 'package:advicer/1_domain/usecases/advice_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../1_domain/failure/failure.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases;
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ups, Api Error.please try again';
      case CacheFailure:
        return 'Ups Cached failed . please try again';
      default:
        return 'Ups something went wrong . please try again';
    }
  }

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
        (failure) =>
            emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
  }
}
