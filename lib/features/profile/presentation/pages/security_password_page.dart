import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// تأكد من مسار الـ AuthField عندك
import '../../../Auth/presentation/widgets/auth_field.dart';

class SecurityPasswordPage extends StatefulWidget {
  const SecurityPasswordPage({super.key});

  @override
  State<SecurityPasswordPage> createState() => _SecurityPasswordPageState();
}

class _SecurityPasswordPageState extends State<SecurityPasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
          "Security & Password",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Your password must be at least 8 characters long and include a combination of numbers, letters, and symbols.",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              // 1. Current Password
              Text(
                "Current Password",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              const AuthField(
                hintText: "Enter current password",
                prefixIcon: Icons.lock_outline,
                isObscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // الانتقال لصفحة نسيت كلمة المرور مستقبلاً
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: const Color(0xFF6C63FF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // 2. New Password
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              const AuthField(
                hintText: "Enter new password",
                prefixIcon: Icons.lock_reset_outlined,
                isObscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),

              SizedBox(height: 24.h),

              // 3. Confirm New Password
              Text(
                "Confirm New Password",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              const AuthField(
                hintText: "Confirm new password",
                prefixIcon: Icons.lock_reset_outlined,
                isObscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),

              SizedBox(height: 40.h),

              // Save Button
              _buildUpdatePasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpdatePasswordButton() {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF90CAF9), Color(0xFF6C63FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Logic for updating password via Supabase
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password updated successfully! 🔒")),
          );
          Navigator.pop(context); // نرجعه للبروفايل بعد التغيير
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          "Update Password",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
