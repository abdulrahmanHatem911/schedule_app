import 'package:flutter/material.dart';

import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/schedule_screen.dart';

class Routers {
  static const String homeScreen = '/';
  static const String scheduleScreen = '/schedule';
}

class RoutersGenerated {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routers.scheduleScreen:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
