import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;
  final bool isFile;

  const ChatMessageBubble({super.key,
    required this.text,
    required this.isSentByMe,
    required this.time,
    this.isFile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        constraints: BoxConstraints(maxWidth: 250.w),
        decoration: BoxDecoration(
          color: isSentByMe
              ? Colors.blue[100]
              : isFile
              ? Colors.grey[200]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment:
          isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (isFile)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.picture_as_pdf, size: 20.sp, color: Colors.red),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ),
                ],
              )
            else
              Text(
                text,
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            SizedBox(height: 4.h),
            Text(
              time,
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
