import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindsense/features/Auth/presentation/pages/home_Page.dart';
import 'package:mindsense/features/clinician/presentation/pages/clinician_dashboard.dart';
import 'package:mindsense/features/Auth/presentation/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MindSenseApp());
}

class MindSenseApp extends StatelessWidget {
  const MindSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit بتهتم بتظبيط المقاسات بناءً على ديزاين فيجما
    return ScreenUtilInit(
      designSize: const Size(390, 844), // مقاس الـ iPhone 14 من فيجما
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MindSense',

          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
          ),

          home: const ClinicianDashboard(),
        );
      },
    );
  }
}
