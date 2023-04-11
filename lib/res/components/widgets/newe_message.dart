import 'dart:developer';

import 'package:chat_app/res/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NeweMessage extends StatefulWidget {
  const NeweMessage({Key? key}) : super(key: key);

  @override
  State<NeweMessage> createState() => _NeweMessageState();
}

class _NeweMessageState extends State<NeweMessage> {
  var _enteredMessage = '';

  final _controller = TextEditingController();
  _sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;
    final useData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    try {
      FirebaseFirestore.instance.collection('chat').add({
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username': useData['username']
      });
      _controller.clear();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              cursorColor: Colors.teal,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: 'send a message',
                  border: InputBorder.none),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed:
                _enteredMessage.trim().isEmpty ? null : () => _sendMessage(),
            icon: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                Icons.send_rounded,
                color: Mycolors.purple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
