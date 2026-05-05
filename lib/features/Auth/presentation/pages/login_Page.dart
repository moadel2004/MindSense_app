import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/home_Page.dart';
import 'package:mindsense/features/layout/presentation/pages/main_layout.dart';
import '../widgets/auth_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            // Logo & Title
            Image.asset(
              'assets/Background+Shadow.png',
              width: 80.w,
            ), // تأكد من وجود اللوجو
            SizedBox(height: 16.h),
            Text(
              "MindSense",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your mindful companion",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),

            SizedBox(height: 32.h),

            // Login/SignUp Toggle (ممكن تستخدم ToggleButtons أو Container بسيط)
            _buildAuthToggle(),

            SizedBox(height: 32.h),

            // Form
            const AuthField(
              hintText: "you@example.com",
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 16.h),
            const AuthField(
              hintText: "Password",
              prefixIcon: Icons.lock_outline,
              isObscureText: true,
              suffixIcon: Icon(Icons.visibility_off_outlined),
            ),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?"),
              ),
            ),

            SizedBox(height: 24.h),

            // Login Button
            _buildLoginButton(context),

            SizedBox(height: 32.h),
            const Text(
              "Or continue with",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24.h),

            // Social Login Row
            _buildSocialButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthToggle() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(child: _toggleItem("Login", true)),
          Expanded(child: _toggleItem("Sign Up", false)),
        ],
      ),
    );
  }

  Widget _toggleItem(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black12, blurRadius: 4.r)]
            : [],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // باقي الـ Widgets (Login Button & Social Buttons)
  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () {
          // الانتقال لصفحة الهوم بعد تسجيل الدخول
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainLayout()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D31FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            SizedBox(width: 8.w),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        Expanded(child: _socialItem("Google", Icons.g_mobiledata)),
        SizedBox(width: 16.w),
        Expanded(child: _socialItem("Apple", Icons.apple)),
      ],
    );
  }

  Widget _socialItem(String label, IconData icon) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
