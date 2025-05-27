import 'package:firebase_mychat/view/chat/ChatDetailsScreen.dart';
import 'package:flutter/material.dart';

class ChatSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> chats;

  ChatSearchDelegate(this.chats);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = chats.where((chat) =>
        chat['name'].toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final chat = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: chat['avatar'].isEmpty
                ? null
                : NetworkImage(chat['avatar']),
          ),
          title: Text(chat['name']),
          subtitle: Text(chat['lastMessage']),
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  chatData: chat,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
