import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_line_app/core/style/app_color.dart';
import 'package:time_line_app/presentation/widgets/loading_widget.dart';

import '../../core/constant/app_size.dart';

import '../controller/event bloc/event_bloc_event.dart';
import '../controller/event%20bloc/event_bloc_bloc.dart';
import '../widgets/header_widget.dart';

import '../../core/constant/enum.dart';

import '../controller/event bloc/event_bloc_state.dart';
import '../widgets/body_card_widget.dart';
import '../widgets/header_date_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late ScrollController scrollController;
  double itemSize = 310.0;
  var currentIndex = 0;
// Initializing
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    setState(() {
      currentIndex = (scrollController.offset / itemSize).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<EventBlocBloc, EventBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.eventState) {
            case EventState.loading:
              return const LoadingComponent();
            case EventState.loaded:
              return SafeArea(
                child: Column(
                  children: [
                    const HeaderComponent(),
                    AppSize.SH_10,
                    HeaderDateComponent(model: state.eventItems[currentIndex]),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<EventBlocBloc>().add(
                                GetAllEventEvent(),
                              );
                        },
                        child: ListView.builder(
                          controller: scrollController,
                          //itemExtent: itemSize,
                          itemCount: state.eventItems.length,
                          padding: const EdgeInsets.only(left: 4.0),
                          itemBuilder: (context, index) {
                            final event = state.eventItems[index];

                            return BodyCardComponent(model: event);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case EventState.error:
              return Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              );
          }
        },
      ),
    );
  }
}
