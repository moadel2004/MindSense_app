import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/home_Page.dart';
import 'package:mindsense/features/analytics/presentation/pages/session_summary_page.dart';
import 'package:mindsense/features/chat/presentation/pages/ai_chat_page.dart';
import 'package:mindsense/features/profile/presentation/pages/profile_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // متغير لتتبع إحنا واقفين في أي تابة
  int _currentIndex = 0;

  List<Widget> get _screens => [
    const HomePage(),
    const AiChatPage(),
    SessionSummaryPage(onClose: () => setState(() => _currentIndex = 0)),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      // الـ body بيتغير بناءً على الاندكس
      body: _screens[_currentIndex],

      // بناء الـ Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
          // عشان لو حابب تخلي الحواف اللي فوق دائرية شوية
          borderRadius: BorderRadius.vertical(top: Radius.circular(70.r)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(70.r)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType
                .fixed, // مهم عشان الزراير متتحركش وتفضل ثابتة
            selectedItemColor: const Color(0xFF6C63FF), // لون الديزاين بتاعك
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.home_outlined, size: 24.sp),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.home, size: 24.sp),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.chat_bubble_outline, size: 24.sp),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.chat_bubble, size: 24.sp),
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.bar_chart_outlined, size: 24.sp),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.bar_chart, size: 24.sp),
                ),
                label: "Analytics",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.person_outline, size: 24.sp),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(Icons.person, size: 24.sp),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
