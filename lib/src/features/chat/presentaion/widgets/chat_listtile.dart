import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text(
        "Lorem Ipsum",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.12,
        ),
      ),
      subtitle: Text(
        "Lorem Ipsum",
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.12,
        ),
      ),
      trailing: Text(
        "12:00",
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.12,
        ),
      ),
    );
  }
}
