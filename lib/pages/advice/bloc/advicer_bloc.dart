import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 4), () {});
      debugPrint('got Advice');
      emit(AdvicerStateLoaded(advice: 'Fake advice to test bloc'));
      emit(AdvicerStateError(message: 'error message'));
    });
  }
}
