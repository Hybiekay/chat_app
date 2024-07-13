import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshproject/model/chat_model.dart';

class ChatService {
  final firebasestore = FirebaseFirestore.instance;
  Future<ChatModel?> initializeChat(String friendId) async {
    var chat;
    try {
      final docs = await firebasestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('chat')
          .doc(friendId)
          .get();

      chat = docs.data();
      if (chat == null) {
        var docs = await firebasestore
            .collection('users')
            .doc(friendId)
            .collection('chat')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get();

        chat = docs.data();

        if (chat == null) {
          var chatData = {
            'userid': FirebaseAuth.instance.currentUser?.uid,
            'friendid': friendId,
            'lastMessage': null,
            'messages': []
          };
          var docs = await firebasestore
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection('chat')
              .doc(friendId)
              .set(chatData);

          var friendData = {
            'userid': friendId,
            'friendid': FirebaseAuth.instance.currentUser?.uid,
            'lastMessage': null,
            'messages': []
          };
          var frienddocs = await firebasestore
              .collection('users')
              .doc(friendId)
              .collection('chat')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set(friendData);

          final savedData = await firebasestore
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection('chat')
              .doc(friendId)
              .get();

          chat = savedData.data();
        }

        ///
      }

      ///

      if (chat != null) {
        ChatModel chatModel = ChatModel.fromMap(chat);
        return chatModel;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }
}
