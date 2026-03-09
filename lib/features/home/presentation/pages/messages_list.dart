import 'package:Linko/core/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:zego_zimkit/zego_zimkit.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({super.key});

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  void initState() {
    super.initState();
    //  ZIMKit().connectUser(id: FirebaseAuth.instance.currentUser!.uid, name: "omar", avatarUrl: "waf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZIMKitConversationListView(
        emptyBuilder: (context, defaultWidget) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'No messages yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        },
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ZIMKitMessageListPage(
              conversationID: conversation.id,
              conversationType: conversation.type,
              appBarBuilder: (context, defaultAppBar) {
                return AppBar(
                  surfaceTintColor: Colors.transparent,
                  title: defaultAppBar.title,
                  centerTitle: true,
                  backgroundColor: AppColors.backgroundColor,
                  iconTheme: const IconThemeData(color: Colors.black),
                );
              },
            );
          }));
        },
      ),
    );
  }
}
