import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastAnalysisCard extends StatelessWidget {
  const LastAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. عنوان القسم (Header)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Last Analysis",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {
                // الانتقال لصفحة الهيستوري
              },
              child: Text(
                "View History",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5A6684), // لون كحلي/رمادي من الديزاين
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        // 2. الكارت نفسه
        Container(
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
              // الصف الأول: Mood State و الحالة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mood State",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "Calm",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                        0xFF6C63FF,
                      ), // نفس لون الفيجما المايل للبنفسجي
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // المؤشر (Custom Slider)
              _buildCustomSlider(),

              SizedBox(height: 16.h),

              // الصف الأخير: الوصف والأيقونة
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "You seemed calm during yesterday's check-in.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // استخدمت أيقونة شجرة، وتقدر تستبدلها بصورة من الـ assets
                  Icon(Icons.eco, color: const Color(0xFF7CB342), size: 28.sp),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // كود الشريط المخصص (عشان يطلع مطابق للديزاين 100%)
  Widget _buildCustomSlider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // نسبة المؤشر (مثلاً 80% من الخط أخضر)
        double percent = 0.8;

        return Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            // الخط الرمادي (الخلفية)
            Container(
              width: double.infinity,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            // الخط الأخضر (مستوى المود)
            Container(
              width: constraints.maxWidth * percent,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E), // لون أخضر فاتح
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            // النقطة السودة في آخر الخط الأخضر
            Positioned(
              left: (constraints.maxWidth * percent) - 6.w,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // النقطة السودة في أول الخط الخضر (لو ركزت في الديزاين هتلاقي واحدة في الأول كمان)
            Positioned(
              left: 0,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
