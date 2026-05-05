import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/mood_tracker_card.dart';
import '../widgets/ai_assistant_card.dart';
import '../widgets/last_analysis_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          // عشان الشاشة تعمل Scroll لو الموبايل صغير
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Hello Katreen)
              _buildHeader(),
              SizedBox(height: 32.h),

              // 2. Mood Tracker
              const MoodTrackerCard(),
              SizedBox(height: 24.h),

              // 3. AI Assistant
              const AiAssistantCard(),
              SizedBox(height: 24.h),

              // 4. Last Analysis
              const LastAnalysisCard(),

              // مسافة فاضية تحت عشان الـ Bottom Nav Bar ميغطيش على آخر كارت
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello 👋",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 4.h),
            Text(
              "Katreen",
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.notifications_none_outlined, size: 28.sp),
            SizedBox(width: 16.w),
            CircleAvatar(
              radius: 22.r,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person_outline,
                size: 24.sp,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
