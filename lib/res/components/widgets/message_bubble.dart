import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.message,
    required this.userId,
    required this.isMe,
    required this.username,
  }) : super(key: key);
  final String message;
  final String userId;
  final String username;
  final String isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          userId == isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: userId == isMe ? Colors.grey.withOpacity(0.5) : Colors.teal,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomRight: userId == isMe
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
              bottomLeft: userId != isMe
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text(".....");
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data!['username'],
                    style: TextStyle(
                      color: userId == isMe ? Colors.black : Colors.white,
                      fontSize: 8,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: userId == isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: userId == isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
