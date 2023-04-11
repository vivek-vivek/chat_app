import 'package:chat_app/res/style/colors.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/9a/90/9a/9a909a545686c6977d21da39d2c4b186.jpg'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'sara ali',
                style: TextStyle(
                  color: Mycolors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('online',
                  style: TextStyle(color: Mycolors.purple, fontSize: 12))
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.videocam,
            color: Mycolors.purple,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: Mycolors.purple,
          ),
        )
      ],
    );
  }
}
