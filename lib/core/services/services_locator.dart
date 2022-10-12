import 'package:get_it/get_it.dart';

import '../../data/data source/remote/remote_event_data_source.dart';
import '../../data/repository/event_repository.dart';
import '../../domain/repository/event_repository.dart';
import '../../domain/use case/get_all_event_use_case.dart';
import '../../presentation/controller/event bloc/event_bloc_bloc.dart';

final GetIt sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // to bloc
    sl.registerFactory(() => EventBlocBloc(sl()));

    // use case
    sl.registerLazySingleton(() => GetAllEventUseCase(sl()));
    // repository
    sl.registerLazySingleton<BaseEventRepository>(
      () => EventRepository(sl()),
    );

    ///DataSources
    sl.registerLazySingleton<BaseRemoteEventDataSource>(
        () => RemoteEventDataSource());
  }
}
