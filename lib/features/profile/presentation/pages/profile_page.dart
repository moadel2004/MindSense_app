import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/login_Page.dart';
import 'package:mindsense/features/profile/presentation/pages/help_support_page.dart';
import '../../domain/entities/user_profile.dart';
import 'personal_info_page.dart'; // استدعاء صفحة البيانات الشخصية اللي عملناها
import 'security_password_page.dart';
import 'notifications_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // داتا وهمية (Mock Data) لحد ما نربط بـ Supabase
    final currentUser = UserProfile(
      id: '1',
      fullName: 'Katreen',
      email: 'katreen@example.com',
      totalSessions: 12,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // نفس لون خلفية الشات
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            // 1. الهيدر (الصورة، الاسم، الإيميل)
            _buildProfileHeader(currentUser),
            SizedBox(height: 32.h),

            // 2. كارت الإحصائيات السريعة (بيطمن اليوزر)
            _buildStatsCard(currentUser),
            SizedBox(height: 32.h),

            // 3. قائمة الإعدادات (Menu) - مررنا الـ context هنا عشان الـ Navigation
            _buildSettingsMenu(context),
            SizedBox(height: 32.h),

            // 4. زرار تسجيل الخروج
            _buildLogoutButton(context),
            SizedBox(height: 40.h), // مسافة عشان الـ Bottom Nav Bar
          ],
        ),
      ),
    );
  }

  // --- الـ Widgets الفرعية ---

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF5F6FA),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfile user) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey.shade300,
              // لما نربط بالباك إند، هنستخدم NetworkImage لو الـ avatarUrl مش فاضي
              backgroundImage: const AssetImage('assets/image 2.png'),
            ),
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          user.fullName,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          user.email,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Widget _buildStatsCard(UserProfile user) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            "Sessions",
            user.totalSessions.toString(),
            Icons.chat_bubble_outline,
          ),
          Container(
            height: 40.h,
            width: 1.w,
            color: Colors.grey.shade200,
          ), // خط فاصل
          _buildStatItem("Status", "Active", Icons.verified_user_outlined),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF6C63FF), size: 28.sp),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  // ضفنا الـ BuildContext هنا
  Widget _buildSettingsMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Settings",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700, // لون العنوان زي الديزاين
          ),
        ),
        SizedBox(height: 16.h),
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
              _buildMenuOption(
                icon: Icons.person_outline,
                title: "Personal Information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfoPage(),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuOption(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuOption(
                icon: Icons.lock_outline,
                title: "Security & Password",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecurityPasswordPage(),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuOption(
                icon: Icons.help_outline,
                title: "Help & Support",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 72.w,
      endIndent: 20.w,
    );
  }

  // ضفنا الـ onTap هنا كـ Parameter
  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F3FF),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(icon, color: const Color(0xFF6C63FF), size: 20.sp),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.sp,
        color: Colors.grey.shade400,
      ),
      onTap: onTap, // تفعيل الضغط
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
          );
        },
        icon: Icon(Icons.logout, color: Colors.red.shade400, size: 22.sp),
        label: Text(
          "Log Out",
          style: TextStyle(
            color: Colors.red.shade400,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: Colors.red.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
