import 'package:Linko/features/home/presentation/pages/messages_list.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Messeges"),
        ),
        body: const MessagesList());
  }
}
