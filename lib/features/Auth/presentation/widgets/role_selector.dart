import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// تعريف الـ Enum لتحديد نوع المستخدم
enum UserRole { patient, doctor }

class RoleSelector extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildRoleCard(
            title: "Patient",
            icon: Icons.person_outline,
            role: UserRole.patient,
            isSelected: selectedRole == UserRole.patient,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildRoleCard(
            title: "Doctor",
            icon: Icons.medical_services_outlined,
            role: UserRole.doctor,
            isSelected: selectedRole == UserRole.doctor,
          ),
        ),
      ],
    );
  }

  Widget _buildRoleCard({
    required String title,
    required IconData icon,
    required UserRole role,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onRoleChanged(role),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF6C63FF).withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF6C63FF) : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF6C63FF)
                  : Colors.grey.shade500,
              size: 28.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF6C63FF)
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
