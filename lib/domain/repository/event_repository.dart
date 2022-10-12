import 'package:dartz/dartz.dart';
import '../use%20case/get_all_event_use_case.dart';
import '../../core/errors/failure.dart';

import '../entity/event.dart';

abstract class BaseEventRepository {
  Future<Either<Failure, List<Event>>> getAllEvents(EventParameters parameters);
}
