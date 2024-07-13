import 'dart:convert';

class ChatModel {
  final String userid;
  final String friendid;
  final dynamic lastMessage;
  List messages;
  ChatModel({
    required this.userid,
    required this.friendid,
    required this.lastMessage,
    required this.messages,
  });

  ChatModel copyWith({
    String? userid,
    String? friendid,
    dynamic? lastMessage,
    List? messages,
  }) {
    return ChatModel(
      userid: userid ?? this.userid,
      friendid: friendid ?? this.friendid,
      lastMessage: lastMessage ?? this.lastMessage,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'friendid': friendid,
      'lastMessage': lastMessage,
      'messages': messages,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      userid: map['userid'] as String,
      friendid: map['friendid'] as String,
      lastMessage: map['lastMessage'] as dynamic,
      messages: List.from((map['messages'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatModel(userid: $userid, friendid: $friendid, lastMessage: $lastMessage, messages: $messages)';
  }
}
