import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionSummaryPage extends StatelessWidget {
  const SessionSummaryPage({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    _buildOverallMoodCard(),
                    SizedBox(height: 16.h),
                    _buildEmotionAnalysisCard(),
                    SizedBox(height: 16.h),
                    _buildAiInsightsCard(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 16.w, 8.h),
      child: Row(
        children: [
          IconButton(
            onPressed: onClose ?? () => Navigator.of(context).maybePop(),
            icon: Icon(Icons.close, size: 26.sp, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              'Session Summary',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  Widget _buildOverallMoodCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF7EB8D4), Color(0xFF4A8FA8)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4A8FA8).withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'OVERALL MOOD',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Good',
            style: TextStyle(
              fontSize: 44.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.trending_up,
                  color: const Color(0xFF7DEEA3),
                  size: 18.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  '+15% improvement',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7DEEA3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionAnalysisCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Emotion Analysis',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Icon(
                Icons.pie_chart_outline,
                size: 22.sp,
                color: Colors.grey[400],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildEmotionBar(
            label: 'Anxiety',
            percent: 0.30,
            color: const Color(0xFF9E9E9E),
          ),
          SizedBox(height: 20.h),
          _buildEmotionBar(
            label: 'Sadness',
            percent: 0.20,
            color: const Color(0xFF9EC5D9),
          ),
          SizedBox(height: 20.h),
          _buildEmotionBar(
            label: 'Hope',
            percent: 0.65,
            color: const Color(0xFF1B4332),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionBar({
    required String label,
    required double percent,
    required Color color,
  }) {
    final percentText = '${(percent * 100).round()}%';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              percentText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 8.h,
            backgroundColor: const Color(0xFFE8E8E8),
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildAiInsightsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -8.h,
            right: -8.w,
            child: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9).withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      size: 20.sp,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'AI Insights',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildInsightItem(
                'You showed remarkable ',
                'resilience',
                ' while discussing family issues today.',
              ),
              SizedBox(height: 14.h),
              _buildInsightItem(
                'Your ',
                'sleep patterns',
                ' are improving, correlating with higher energy levels.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String before, String bold, String after) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 7.h),
          width: 8.w,
          height: 8.w,
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                height: 1.5,
              ),
              children: [
                TextSpan(text: before),
                TextSpan(
                  text: bold,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: after),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
      child: SizedBox(
        width: double.infinity,
        height: 54.h,
        child: ElevatedButton(
          onPressed: onClose ?? () => Navigator.of(context).maybePop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6B8299),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Save & Return',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.check_circle_outline, color: Colors.white, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
