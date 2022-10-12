import 'package:equatable/equatable.dart';

abstract class EventBlocEvent extends Equatable {
  const EventBlocEvent();
  @override
  List<Object> get props => [];
}

class GetAllEventEvent extends EventBlocEvent {}
