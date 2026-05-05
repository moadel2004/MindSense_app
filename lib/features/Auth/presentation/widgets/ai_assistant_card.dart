import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiAssistantCard extends StatefulWidget {
  const AiAssistantCard({super.key});

  @override
  State<AiAssistantCard> createState() => _AiAssistantCardState();
}

class _AiAssistantCardState extends State<AiAssistantCard> {
  // هنخلي الـ Text هو الديفولت (الاندكس 1)
  int selectedMode = 1;

  final List<Map<String, dynamic>> chatModes = [
    {'icon': Icons.mic_none_outlined, 'label': 'Voice'},
    {'icon': Icons.description_outlined, 'label': 'Text'},
    {'icon': Icons.videocam_outlined, 'label': 'Video'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الهيدر (العنوان + الأيقونة)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chat with Ai Assistant",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Icon(
                Icons
                    .psychology_outlined, // دي أقرب أيقونة فلاتر، وممكن تستبدلها بصورتك
                size: 28.sp,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // 2. خيارات المحادثة (صوت - نص - فيديو)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              chatModes.length,
              (index) => _buildModeOption(
                icon: chatModes[index]['icon'],
                label: chatModes[index]['label'],
                index: index,
              ),
            ),
          ),
          SizedBox(height: 24.h),

          // 3. زرار البدء
          GestureDetector(
            onTap: () {
              // هنا هنكتب لوجيك الانتقال لصفحة الشات بناءً على الـ selectedMode
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFFDCE2EF), // لون الزرار الفاتح من الديزاين
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Now",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward, size: 20.sp, color: Colors.black87),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget منفصل لكل خيار
  Widget _buildModeOption({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedMode == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFF5F6F8),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.black26 : Colors.transparent,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: Colors.black87),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
