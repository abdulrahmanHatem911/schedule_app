import 'package:flutter/material.dart';

import '../../core/constant/contant_api.dart';
import '../../domain/entity/event.dart';

class UserComponent extends StatelessWidget {
  final List<EventUsers> users;
  const UserComponent({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image(
                  image: NetworkImage(
                    ApiContent.getImage('${users[index].profilePicture}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
