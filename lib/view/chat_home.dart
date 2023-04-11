import 'dart:developer';
import 'package:chat_app/res/components/widgets/buttons.dart';
import 'package:chat_app/res/style/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../res/components/widgets/chat_card.dart';
import '../res/components/widgets/home_titile.dart';
import '../res/components/widgets/search_bar.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("app Started ...");
    return Scaffold(
      backgroundColor: Mycolors.grey1,
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AppBar(
                elevation: 0,
                backgroundColor: Mycolors.grey1,
                actions: [
                  DropdownButton(
                    underline: const SizedBox(),
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.deepPurple,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'logout',
                        child: Row(
                          children: const [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.teal,
                            ),
                            SizedBox(width: 8),
                            Text('Logout')
                          ],
                        ),
                      )
                    ],
                    onChanged: (value) {
                      if (value == 'logout') {
                        FirebaseAuth.instance.signOut();
                      }
                    },
                  ),
                ],
              )),
          const TitleHead(),
          Row(children: const [SearchBarHome(), Spacer(), AddChat(), Spacer()]),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chats/dTqN05piFehgEx4EzBu2/messages')
                .snapshots(),
            builder: (context, stremSnapshot) {
              if (stremSnapshot.connectionState == ConnectionState.waiting) {
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

              final documents = stremSnapshot.data!.docChanges;
              log(documents.toString());
              return ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) =>
                    ChatCard(index: index, documents: documents),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: documents.length,
              );
            },
          )
        ],
      ),
    );
  }
}
