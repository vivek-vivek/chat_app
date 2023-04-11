import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  // add new message
  void newMessage() {
    String collectionName = 'chats/dTqN05piFehgEx4EzBu2/messages';
    FirebaseFirestore.instance.collection(collectionName).add(
      {'text': 'new messgae'},
    );
  }
}
