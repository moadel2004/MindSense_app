import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // متغيرات وهمية لحد ما تتربط بالداتابيز أو SharedPreferences
  bool _sessionReminders = true;
  bool _dailyAffirmations = true;
  bool _newMessages = true;
  bool _appUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notification Preferences",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Choose what notifications you want to receive to stay updated and mindful.",
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade500,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            // حاوية الإعدادات عشان شكلها يبقى كارت نظيف زي الـ Profile
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSwitchTile(
                    title: "Session Reminders",
                    subtitle: "Get notified 30 minutes before your session.",
                    icon: Icons.calendar_today_outlined,
                    value: _sessionReminders,
                    onChanged: (val) => setState(() => _sessionReminders = val),
                  ),
                  _buildDivider(),
                  _buildSwitchTile(
                    title: "Daily Affirmations",
                    subtitle: "Receive a positive message every morning.",
                    icon: Icons.wb_sunny_outlined,
                    value: _dailyAffirmations,
                    onChanged: (val) =>
                        setState(() => _dailyAffirmations = val),
                  ),
                  _buildDivider(),
                  _buildSwitchTile(
                    title: "New Messages",
                    subtitle: "Alerts for replies from your AI assistant.",
                    icon: Icons.chat_bubble_outline,
                    value: _newMessages,
                    onChanged: (val) => setState(() => _newMessages = val),
                  ),
                  _buildDivider(),
                  _buildSwitchTile(
                    title: "App Updates",
                    subtitle: "Receive news about new features.",
                    icon: Icons.system_update_outlined,
                    value: _appUpdates,
                    onChanged: (val) => setState(() => _appUpdates = val),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F3FF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: const Color(0xFF6C63FF), size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF6C63FF),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 64.w,
      endIndent: 20.w,
    );
  }
}
