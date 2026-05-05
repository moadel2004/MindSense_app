import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/login_Page.dart';
import '../../../../core/utils/app_assets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  String _getImage(int index) {
    switch (index) {
      case 0:
        return AppAssets.onboarding1;
      case 1:
        return AppAssets.onboarding2;
      case 2:
        return AppAssets.onboarding3;
      default:
        return AppAssets.onboarding1;
    }
  }

  List<TextSpan> _getTitleSpans(int index) {
    switch (index) {
      case 0:
        return [
          const TextSpan(text: "مرحبا بك في "),
          const TextSpan(
            text: "مساحتك الآمنة",
            style: TextStyle(color: Color(0xFF4C46B8)),
          ),
        ];
      case 1:
        return [
          const TextSpan(text: "نسمعك ونفهمك "),
          const TextSpan(
            text: "بعمق",
            style: TextStyle(color: Color(0xFF4C46B8)),
          ),
        ];
      case 2:
        return [
          const TextSpan(text: "خصوصيتك أولويتنا "),
          const TextSpan(text: "دائماً"),
        ];
      default:
        return [];
    }
  }

  String _getSubtitle(int index) {
    switch (index) {
      case 0:
        return "نحن هنا لنسمعك ونساعدك في رحلتك نحو الصحة النفسية. دعنا نبدأ معاً خطوة بخطوة.";
      case 1:
        return "تقنيات الذكاء الاصطناعي لدينا تحلل نبرة صوتك وكلماتك لتقديم الدعم النفسي الأمثل الذي يناسب حالتك الشعورية.";
      case 2:
        return "نحن نستخدم أحدث تقنيات التشفير لحماية محادثاتك وسجلاتك الصحية. أنت الوحيد الذي يملك حق الوصول إليها.";
      default:
        return "";
    }
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      alignment: WrapAlignment.center,
      children: [
        _buildChip("تعبيرات الوجه", Icons.emoji_emotions, Colors.orange),
        _buildChip(
          "تحليل النص",
          Icons.chat_bubble_outline,
          const Color(0xFF4C46B8),
        ),
        _buildChip("تحليل الصوت", Icons.mic, const Color(0xFF4C46B8)),
      ],
    );
  }

  Widget _buildChip(String label, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF4C46B8),
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(icon, size: 16.sp, color: iconColor),
        ],
      ),
    );
  }

  Widget _buildSecurityList() {
    return Column(
      children: [
        _buildSecurityItem("تشفير كامل للبيانات", Icons.vpn_key),
        SizedBox(height: 16.h),
        _buildSecurityItem("لا تتبع أو بيع للبيانات", Icons.block),
      ],
    );
  }

  Widget _buildSecurityItem(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 12.w),
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: const BoxDecoration(
            color: Color(0xFFEEEDFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF4C46B8), size: 20.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FF),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "تخطي",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(32.w),
                      child: Image.asset(_getImage(index), fit: BoxFit.contain),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: _currentIndex == index ? 24.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? const Color(0xFF4C46B8)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: _getTitleSpans(_currentIndex),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (_currentIndex == 1) _buildTags(),
                    if (_currentIndex == 2) _buildSecurityList(),
                    SizedBox(height: 24.h),
                    Text(
                      _getSubtitle(_currentIndex),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      height: 55.h,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4C46B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentIndex == 2 ? "ابدأ الآن" : "التالي",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (_currentIndex != 2) ...[
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
