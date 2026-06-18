import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

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
          "Help & Support",
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
                "How can we help you?",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "It looks like you have problems with our system. We are here to help you.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              // 1. كروت التواصل السريع (Contact Cards)
              Row(
                children: [
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.chat_bubble_outline,
                      title: "Live Chat",
                      subtitle: "Start a conversation",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.email_outlined,
                      title: "Email Us",
                      subtitle: "support@mindsense.com",
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              // 2. الأسئلة الشائعة (FAQs)
              Text(
                "Frequently Asked Questions",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.h),

              _buildFAQItem(
                question: "Is my data secure and private?",
                answer:
                    "Yes, MindSense uses end-to-end encryption. Your conversations with the AI and your clinicians are completely private and compliant with health data standards.",
              ),
              SizedBox(height: 12.h),
              _buildFAQItem(
                question: "How do I book a session with a real doctor?",
                answer:
                    "You can navigate to the 'Home' tab and click on 'Find a Clinician'. You'll be able to browse available doctors and select a time slot that suits you.",
              ),
              SizedBox(height: 12.h),
              _buildFAQItem(
                question: "Can I change my AI assistant's behavior?",
                answer:
                    "Currently, the AI adapts to your conversational style naturally over time. We are working on a feature to let you manually adjust its tone in future updates.",
              ),
              SizedBox(height: 12.h),
              _buildFAQItem(
                question: "How to reset my password?",
                answer:
                    "Go to Profile > Settings > Security & Password, and you can update your password there.",
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  // تصميم كارت التواصل
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
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
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F3FF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFF6C63FF), size: 24.sp),
            ),
            SizedBox(height: 16.h),
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
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  // تصميم سؤال من الأسئلة الشائعة (FAQ) بيفتح ويقفل بـ Animation
  Widget _buildFAQItem({required String question, required String answer}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // Theme عشان نشيل الخطوط الديفولت بتاعة فلاتر اللي بتظهر لما الـ ExpansionTile يتفتح
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: const Color(0xFF6C63FF),
          collapsedIconColor: Colors.grey.shade400,
          title: Text(
            question,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
