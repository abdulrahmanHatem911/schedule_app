import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_line_app/core/constant/app_routers.dart';
import 'package:time_line_app/core/style/theme.dart';
import 'data/data%20source/remote/remote_event_data_source.dart';
import 'data/repository/event_repository.dart';
import 'domain/use%20case/get_all_event_use_case.dart';
import 'presentation/controller/event%20bloc/event_bloc_bloc.dart';
import 'presentation/controller/event bloc/event_bloc_event.dart';
import 'presentation/screens/schedule_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteEventDataSource remoteEventDataSource = RemoteEventDataSource();
    EventRepository eventRepository = EventRepository(remoteEventDataSource);
    GetAllEventUseCase getAllEventUseCase = GetAllEventUseCase(eventRepository);
    return BlocProvider(
      create: (BuildContext context) {
        return EventBlocBloc(getAllEventUseCase)..add(GetAllEventEvent());
      },
      lazy: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RoutersGenerated.onGenerateRoute,
        initialRoute: Routers.homeScreen,
      ),
    );
  }
}
