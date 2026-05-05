import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodTrackerCard extends StatefulWidget {
  const MoodTrackerCard({super.key});

  @override
  State<MoodTrackerCard> createState() => _MoodTrackerCardState();
}

class _MoodTrackerCardState extends State<MoodTrackerCard> {
  // متغير عشان نحفظ الاندكس بتاع المود اللي اليوزر اختاره (عشان نعمله Select لاحقاً)
  int selectedIndex = -1;

  // ليست فيها الداتا عشان منكررش الكود 4 مرات
  final List<Map<String, String>> moods = [
    {'emoji': '😡', 'label': 'Angry'},
    {'emoji': '😃', 'label': 'Grinning'},
    {'emoji': '🤩', 'label': 'Star-Struck'},
    {'emoji': '😔', 'label': 'Pensive'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w), // مسافات داخلية للكارت
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r), // حواف دائرية زي الديزاين
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. العنوان الرئيسي
          Text(
            "How are you feeling?",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6.h),

          // 2. العنوان الفرعي
          Text(
            "Track your mood to see patterns over time.",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          ),
          SizedBox(height: 20.h),

          // 3. صف الإيموجيز
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // بيوزع المسافات بالتساوي
            children: List.generate(
              moods.length,
              (index) => _buildMoodItem(
                emoji: moods[index]['emoji']!,
                label: moods[index]['label']!,
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget منفصل لكل عنصر (إيموجي + نص)
  Widget _buildMoodItem({
    required String emoji,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // تحديث الحالة لما اليوزر يدوس
        });
      },
      child: Column(
        children: [
          // الدايرة اللي فيها الإيموجي
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFE8E7FF)
                  : Colors.grey[200], // لون الدايرة بيتغير لو اخترته
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF6C63FF)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Text(
              emoji,
              style: TextStyle(
                fontSize: 24.sp,
              ), // استخدمت الإيموجيز العادية مؤقتاً
            ),
          ),
          SizedBox(height: 8.h),
          // النص اللي تحت الإيموجي
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? const Color(0xFF6C63FF) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
