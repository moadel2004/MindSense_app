import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/On_boarding_Page.dart';
import 'package:mindsense/features/Auth/presentation/pages/login_Page.dart';
import '../../../../core/utils/app_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      // 2. Logic التوجيه: هنا مستقبلاً هنقرر يروح فين (Onboarding ولا Login ولا Home)
      // حالياً هنوديه للـ Onboarding مباشرة
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // نفس التصميم اللي في الـ Native Splash عشان اليوزر ميحسش بفرق
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6C63FF), Color(0xFF4C46B8)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Image.asset(
              AppAssets.splashLogo,
              width: 300.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
