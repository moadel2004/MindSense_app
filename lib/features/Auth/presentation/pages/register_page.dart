import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/auth_field.dart';
import '../widgets/role_selector.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // القيمة الافتراضية للتسجيل هي مريض
  UserRole _selectedRole = UserRole.patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),

              // 1. Logo & Title
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF), // لون خلفية اللوجو
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(Icons.psychology, color: Colors.white, size: 40.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                "MindSense",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Your mindful companion",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
              ),

              SizedBox(height: 32.h),

              // 2. Login / Sign Up Toggle
              _buildAuthToggle(context),

              SizedBox(height: 24.h),

              // 3. Role Selector (تحديد نوع الحساب)
              RoleSelector(
                selectedRole: _selectedRole,
                onRoleChanged: (newRole) {
                  setState(() {
                    _selectedRole = newRole;
                  });
                },
              ),

              SizedBox(height: 24.h),

              // 4. Input Fields (حقول الإدخال)
              const AuthField(
                hintText: "Full Name",
                prefixIcon: Icons.person_outline,
              ),
              SizedBox(height: 16.h),
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

              SizedBox(height: 32.h),

              // 5. Sign Up Button (Gradient Button)
              _buildRegisterButton(),

              SizedBox(height: 24.h),

              // 6. Divider (Or continue with)
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              SizedBox(height: 24.h),

              // 7. Social Buttons
              _buildSocialButtons(),

              SizedBox(height: 32.h),

              // 8. Terms and Privacy
              _buildTermsText(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildAuthToggle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // العودة لصفحة تسجيل الدخول
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.transparent, // غير محدد
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white, // محدد
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: const Color(0xFF6C63FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF90CAF9),
            Color(0xFF607D8B),
          ], // التدرج اللوني المطابق للصورة الجديدة
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ElevatedButton(
        onPressed: () {
          // اللوجيك الخاص بإنشاء الحساب
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            // استبدل الأيقونة بصورة جوجل الحقيقية من الـ assets إذا توفرت
            icon: Icon(Icons.g_mobiledata, color: Colors.black87, size: 28.sp),
            label: Text(
              "Google",
              style: TextStyle(color: Colors.black87, fontSize: 14.sp),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.apple, color: Colors.black87, size: 24.sp),
            label: Text(
              "Apple",
              style: TextStyle(color: Colors.black87, fontSize: 14.sp),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: Colors.grey.shade500, fontSize: 11.sp),
        children: [
          const TextSpan(text: "By signing up, you agree to our "),
          TextSpan(
            text: "Terms",
            style: TextStyle(
              color: const Color(0xFF6C63FF),
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: const Color(0xFF6C63FF),
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: "."),
        ],
      ),
    );
  }
}
