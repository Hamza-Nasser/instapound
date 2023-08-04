import 'package:flutter/material.dart';
import 'package:instapound/src/core/utils/widgets/circle.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.name,
  });

  // RoomModel
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Circle(
          radius: 35,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 60,
          child: Text(
            name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.12,
            ),
          ),
        )
      ],
    );
  }
}
