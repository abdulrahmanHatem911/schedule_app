import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failure.dart';
import '../entity/event.dart';
import '../repository/event_repository.dart';

class GetAllEventUseCase {
  final BaseEventRepository baseEventRepository;
  GetAllEventUseCase(
    this.baseEventRepository,
  );
  Future<Either<Failure, List<Event>>> call(EventParameters parameters) async {
    return await baseEventRepository.getAllEvents(parameters);
  }
}

class EventParameters extends Equatable {
  final int numberPage;
  const EventParameters({
    required this.numberPage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        numberPage,
      ];
}
