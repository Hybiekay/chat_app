import 'package:flutter/material.dart';
import 'package:freshproject/constant/constant.dart';
import 'package:freshproject/model/chat_model.dart';
import 'package:freshproject/model/users_model.dart';
import 'package:freshproject/provider/all_users_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel chatModel;
  const ChatScreen({super.key, required this.chatModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  UserModel? friendModel;

  @override
  void initState() {
    getFriendData();
    super.initState();
  }

  getFriendData() {
    friendModel =
        context.read<AllUsersProvider>().getUserById(widget.chatModel.friendid);
  }

  @override
  Widget build(BuildContext context) {
    return friendModel == null
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).cardColor,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(friendModel!.profilePic),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(friendModel!.name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(
                        'Active now',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: Image.asset(AppImages.calls)),
                IconButton(
                    onPressed: () {}, icon: Image.asset(AppImages.videos)),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 22,
                    width: 70,
                    color: Color.fromARGB(255, 213, 197, 197),
                    child: Text('Today'),
                  ),
                ],
              ),
            ),
          );
  }
}
