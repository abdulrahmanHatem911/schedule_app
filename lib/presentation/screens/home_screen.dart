import 'package:flutter/material.dart';
import 'package:time_line_app/core/constant/app_routers.dart';
import 'package:time_line_app/core/style/app_color.dart';
import 'schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.redLight,
              minimumSize: const Size(double.infinity, 50.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routers.scheduleScreen);
            },
            child: const Text(
              'Schedule Screen',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
