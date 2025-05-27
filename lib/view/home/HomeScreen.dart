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
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,

        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [

          TextFormField(
            decoration: InputDecoration(
              hintText: "Search chats...",
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.search, color: Colors.blueAccent),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ChatSearchDelegate(_chats),
                    );
                  },
                  splashRadius: 24,
                ),
              ),
            ),
          ),


          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/${index % 2 == 0
                                ? 'men'
                                : 'women'}/$index.jpg'),
                      ),
                      const SizedBox(height: 4),
                      Text(index == 0 ? 'You' : 'User $index'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          // Chat list
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

