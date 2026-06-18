import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Auth/presentation/widgets/auth_field.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // كُنترولرز للتحكم في النصوص وعرض البيانات القادمة من الداتابيز
  final TextEditingController _nameController = TextEditingController(
    text: "Katreen",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "katreen@example.com",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "+20 123 456 7890",
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
          "Personal Information",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة البروفايل مع إمكانية التغيير
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: const AssetImage('assets/image 2.png'),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                        color: Color(0xFF6C63FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),

              // الحقول النصية (مستدير من الـ AuthField اللي صممته قبل كده)
              Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              AuthField(
                hintText: "Enter your name",
                prefixIcon: Icons.person_outline,
                // لو الـ AuthField بيقبل controller ضيفه هنا، لو لأ سيب القيمة ديفولت
              ),

              SizedBox(height: 20.h),

              Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              const AuthField(
                hintText: "Enter your email",
                prefixIcon: Icons.email_outlined,
              ),

              SizedBox(height: 20.h),

              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 8.h),
              const AuthField(
                hintText: "Enter your phone number",
                prefixIcon: Icons.phone_android_outlined,
              ),

              SizedBox(height: 40.h),

              // زرار حفظ التعديلات (Gradient)
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
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
          // هنا هيتم استدعاء الـ Supabase Update query لحفظ البيانات الجديدة
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Changes saved successfully! 🎉")),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          "Save Changes",
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
