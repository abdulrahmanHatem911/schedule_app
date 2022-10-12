import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../core/constant/enum.dart';
import '../../../domain/use%20case/get_all_event_use_case.dart';

import 'event_bloc_event.dart';
import 'event_bloc_state.dart';

class EventBlocBloc extends Bloc<EventBlocEvent, EventBlocState> {
  GetAllEventUseCase getAllEventUseCase;
  int refreshTopRatedMoviePage = 1;
  EventBlocBloc(
    this.getAllEventUseCase,
  ) : super(const EventBlocState()) {
    on<GetAllEventEvent>(_getAllData);
  }

  FutureOr<void> _getAllData(
      GetAllEventEvent event, Emitter<EventBlocState> emit) async {
    final result = await getAllEventUseCase.call(
      EventParameters(numberPage: refreshTopRatedMoviePage++),
    );
    result.fold(
      (l) => emit(state.copyWith(
        eventState: EventState.error,
        message: l.message,
      )),
      (r) => emit(
        state.copyWith(
          eventState: EventState.loaded,
          eventItems: r,
        ),
      ),
    );
  }
}
