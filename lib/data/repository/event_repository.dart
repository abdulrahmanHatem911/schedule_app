import '../../core/errors/exeption.dart';
import '../data%20source/remote/remote_event_data_source.dart';
import '../../domain/entity/event.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/event_repository.dart';
import '../../domain/use%20case/get_all_event_use_case.dart';

class EventRepository extends BaseEventRepository {
  final RemoteEventDataSource remoteEventDataSource;
  EventRepository(
    this.remoteEventDataSource,
  );
  @override
  Future<Either<Failure, List<Event>>> getAllEvents(
      EventParameters parameters) async {
    final result =
        await remoteEventDataSource.getAllEventDataSource(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return const Left(
        ServerFailure(message: 'Error '),
      );
    }
  }
}
