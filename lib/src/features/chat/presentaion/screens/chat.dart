import 'package:flutter/material.dart';
import 'package:instapound/src/features/auth/presentation/widgets/search.dart';
import 'package:instapound/src/features/chat/presentaion/widgets/chat_listtile.dart';
import 'package:instapound/src/features/chat/presentaion/widgets/chats_appbar.dart';
import 'package:instapound/src/features/chat/presentaion/widgets/rooms.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Start call",
      "Your Rooms",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
      "Lorem Ipsum",
    ];
    var normalView = SizedBox(
      height: 900,
      child: ListView(
        children: [
          // search bar
          Column(
            children: [
              const SearchFieldBar(),
              const SizedBox(height: 15),
              // rooms
              Rooms(list: list),
              const SizedBox(height: 15),
            ],
          ),
          // chats
          SizedBox(
            height: 900,
            child: ListView.builder(
              itemCount: 10,
              // dragStartBehavior: DragStartBehavior.down,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
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
              },
            ),
          ),
        ],
      ),
    );
    var sliverView = CustomScrollView(
      slivers: [
        const SliverChatsAppBar(),
        // search bar
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SearchFieldBar(),
              const SizedBox(height: 15),
              // rooms
              Rooms(list: list),
              const SizedBox(height: 15),
            ],
          ),
        ),
        // chats
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ChatListTile();
            },
            childCount: 15,
          ),
        ),
      ],
    );

    return Scaffold(
      body: sliverView,
    );
  }
}
