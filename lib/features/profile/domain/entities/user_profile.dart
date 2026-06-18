class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;
  final int totalSessions; // عدد الجلسات اللي المريض عملها

  UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl = '',
    this.totalSessions = 0,
  });
}
