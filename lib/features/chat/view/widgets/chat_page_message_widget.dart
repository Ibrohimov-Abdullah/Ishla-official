import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_page_buble_widget.dart';
class ChatMessagesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello sir, Good Morning',
      'isSentByMe': false,
      'time': '09:30',
    },
    {
      'text':
      'Morning! Can I help you? I saw the UI/UX Designer vacancy that you uploaded on LinkedIn yesterday and I’m interested in joining your company.',
      'isSentByMe': true,
      'time': '09:32',
    },
    {
      'text': 'Yes, please send your CV/Resume HERE',
      'isSentByMe': false,
      'time': '09:35',
    },
    {
      'text': 'Janet_CV_UI_UX Designer.pdf',
      'isSentByMe': true,
      'time': '09:35',
      'isFile': true,
    },
  ];

  ChatMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatMessageBubble(
          text: message['text'],
          isSentByMe: message['isSentByMe'],
          time: message['time'],
          isFile: message['isFile'] ?? false,
        );
      },
    );
  }
}
