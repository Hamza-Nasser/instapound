import 'package:flutter/material.dart';

import 'room.dart';

class Rooms extends StatelessWidget {
  const Rooms({
    super.key,
    required this.list,
  });
  // RoomModels
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 10 ? 0.0 : 16.0, left: index == 0 ? 16.0 : 0.0),
            child: RoomWidget(name: list[index]),
          );
        },
      ),
    );
  }
}
