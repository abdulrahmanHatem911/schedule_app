import 'package:flutter/material.dart';
import 'package:time_line_app/core/constant/app_size.dart';
import 'package:time_line_app/core/style/app_color.dart';
import '../../core/constant/functions_app.dart';

import '../../domain/entity/event.dart';

class HeaderDateComponent extends StatelessWidget {
  final Event model;
  const HeaderDateComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(color: AppColor.redLight, width: 2.0),
              ),
              child: Center(
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColor.redLight,
                  size: 30.0,
                ),
              ),
            ),
            AppSize.SH_10,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppFunctions.formatDate(
                        date: '${model.date.split('T')[0]}', typeFormat: 'dd'),
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppFunctions.formatDate(
                            date: '${model.date.split('T')[0]}',
                            typeFormat: 'EEEE'),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      AppSize.SV_2,
                      Text(
                        AppFunctions.formatDate(
                            date: '${model.date.split('T')[0]}',
                            typeFormat: 'MMM yyyy'),
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
