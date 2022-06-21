import 'package:flutter/material.dart';
import 'package:untitled/pages/logged_in_page.dart';

// TODO: chat page
class ChatPage extends StatefulWidget {
  static String route = "ChatPage";

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'chat page',
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}
