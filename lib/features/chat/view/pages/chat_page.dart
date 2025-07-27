import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/chat_page_input_widget.dart';
import '../widgets/chat_page_message_widget.dart';

class ChatPage extends StatelessWidget {
  final String receiverName;

  const ChatPage({super.key, required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 25.sp, color: Colors.white),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receiverName,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12.sp, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, size: 24.sp),
            onPressed: () {},
          ),
          IconButton( 
            icon: Icon(Icons.more_vert, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatMessagesWidget()),
          ChatInputWidget(),
        ],
      ),
    );
  }
}
