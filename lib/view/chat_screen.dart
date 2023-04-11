import 'dart:developer';

import 'package:chat_app/res/components/widgets/message_bubble.dart';
import 'package:chat_app/res/components/widgets/newe_message.dart';
import 'package:chat_app/res/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../res/components/widgets/chat_app_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.width * 0.15),
          child: const ChatAppBar()),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Expanded(child: Messages()),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal.withOpacity(0.15)),
                child: const NeweMessage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: false,
          )
          .snapshots(),
      builder: (context, chatsnpshort) {
        if (chatsnpshort.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Mycolors.purple,
              ),
            ),
          );
        }
        final chatDoc = chatsnpshort.data!.docChanges;
        final uid = FirebaseAuth.instance.currentUser!.uid;

        return ListView.builder(
          itemCount: chatDoc.length,
          itemBuilder: (context, index) {
            log(chatDoc[index].doc['userId']);
            return MessageBubble(
              message: chatDoc[index].doc['text'].toString(),
              userId: chatDoc[index].doc['userId'],
              username: chatDoc[index].doc['username'],
              isMe: uid,
              key: ValueKey(chatDoc[index].doc.id),
            );
          },
        );
      },
    );
  }
}
