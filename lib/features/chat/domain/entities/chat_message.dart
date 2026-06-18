class ChatMessage {
  final String text;
  final bool isUser; // true لو المريض اللي باعت، false لو الذكاء الاصطناعي
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
