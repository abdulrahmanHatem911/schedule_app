import 'package:equatable/equatable.dart';
import '../../../core/constant/enum.dart';
import '../../../domain/entity/event.dart';

class EventBlocState extends Equatable {
  final EventState eventState;
  final String message;
  final List<Event> eventItems;
  const EventBlocState({
    this.eventState = EventState.loading,
    this.message = '',
    this.eventItems = const [],
  });
  EventBlocState copyWith({
    EventState? eventState,
    String? message,
    List<Event>? eventItems,
  }) {
    return EventBlocState(
      eventState: eventState ?? this.eventState,
      message: message ?? this.message,
      eventItems: eventItems ?? this.eventItems,
    );
  }

  @override
  List<Object?> get props => [
        eventState,
        message,
        eventItems,
      ];
}
