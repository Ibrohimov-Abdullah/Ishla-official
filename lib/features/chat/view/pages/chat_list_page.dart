import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'chat_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(),
          Expanded(child: ChatListWidget()),
        ],
      ),
    );
  }
}

// Search Bar Widget
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
          prefixIcon: Icon(Icons.search, size: 20.sp, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

// Chat List Widget
class ChatListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Andy',
      'message': 'Oh yes, please send your CV/Res...',
      'time': '5m ago',
      'unread': true,
    },
    {
      'name': 'Giorgio ',
      'message': 'Good Morning',
      'time': '30m ago',
      'unread': false,
    },
    // Add more dummy data as needed
  ];

  ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatListItem(
          name: chat['name'],
          message: chat['message'],
          time: chat['time'],
          unread: chat['unread'],
          onTap: () {
            Get.to(() => ChatPage(receiverName: chat['name']));
          },
        );
      },
    );
  }
}

// Chat List Item Widget
class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool unread;
  final VoidCallback onTap;

  const ChatListItem({super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 25.r,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 30.sp, color: Colors.white),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          if (unread)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              width: 10.w,
              height: 10.h,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}