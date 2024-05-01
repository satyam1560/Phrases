import 'package:advicer/1_domain/usecases/advice_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../1_domain/failure/failure.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final AdviceUseCases adviceUseCases;
  AdvicerBloc({required this.adviceUseCases}) : super(AdvicerInitial()) {
    String mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return 'Ups, Api Error.please try again';
        case CacheFailure:
          return 'Ups Cached failed . please try again';
        default:
          return 'Ups something went wrong . please try again';
      }
    }

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      debugPrint('fake get advice triggered');
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
          (failure) =>
              emit(AdvicerStateError(message: mapFailureToMessage(failure))),
          (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
      // debugPrint(advice.advice);

      // await Future.delayed(const Duration(seconds: 4), () {});
      debugPrint('got Advice');

      //
    });
  }
}
