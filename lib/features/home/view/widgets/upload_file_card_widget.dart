import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadedFileCard extends StatelessWidget {
  final String fileName;
  final VoidCallback onRemove;

  const UploadedFileCard({super.key, required this.fileName, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf, size: 24.sp, color: Colors.red),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              fileName,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(Icons.delete, size: 20.sp, color: Colors.red),
          ),
        ],
      ),
    );
  }
}