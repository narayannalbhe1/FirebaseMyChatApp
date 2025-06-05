import 'package:firebase_mychat/bottomNavBar/CustomBottomNavBar.dart';
import 'package:firebase_mychat/view/chat/ChatDetailsScreen.dart';
import 'package:firebase_mychat/view/chat/ChatSearchDelegate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // Sample chat data
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'John Doe',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'lastMessage': 'Hey, how are you doing?',
      'time': '10:30 AM',
      'unread': 2,
    },
    {
      'name': 'Jane Smith',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'lastMessage': 'Meeting at 3 PM',
      'time': 'Yesterday',
      'unread': 0,
    },
    {
      'name': 'Team Flutter',
      'avatar': '',
      'lastMessage': 'Alice: I pushed the new changes',
      'time': '2 days ago',
      'unread': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
        child: Column(
          children: [

            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search chats...",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 0.8),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.1),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.blueAccent),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: ChatSearchDelegate(_chats),
                        );
                      },
                      splashRadius: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: _chats.length,
                itemBuilder: (context, index) {
                  final chat = _chats[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: chat['avatar'].isEmpty
                          ? null
                          : NetworkImage(chat['avatar']),
                      child: chat['avatar'].isEmpty
                          ? Text(chat['name'][0])
                          : null,
                    ),
                    title: Text(chat['name']),
                    subtitle: Text(
                      chat['lastMessage'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chat['time'],
                          style: const TextStyle(fontSize: 12),
                        ),
                        if (chat['unread'] > 0)
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.blue,
                            child: Text(
                              chat['unread'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
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
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.chat),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}

