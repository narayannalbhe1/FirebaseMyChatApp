import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final Map<String, dynamic> chatData;

  const ChatDetailScreen({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: chatData['avatar'].isEmpty
                  ? null
                  : NetworkImage(chatData['avatar']),
            ),
            const SizedBox(width: 10),
            Text(chatData['name']),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                // Chat messages would go here
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}