import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;
  final bool isAudio;
  final String? audioDuration;

  ChatMessage({
    this.text = "",
    required this.isUser,
    required this.time,
    this.isAudio = false,
    this.audioDuration,
  });
}

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _messageController = TextEditingController();

  // الداتا الوهمية المطابقة للفيجما
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hello! I am here to listen. How are you feeling today?",
      isUser: false,
      time: "9:41 AM",
    ),
    ChatMessage(
      text:
          "I've been feeling a bit anxious lately, honestly. It's been hard to focus at work.",
      isUser: true,
      time: "9:42 AM",
    ),
    ChatMessage(
      text:
          "I understand. It's completely normal to feel that way sometimes. Can you tell me more about what specifically triggers that anxiety when you're working?",
      isUser: false,
      time: "9:43 AM",
    ),
    ChatMessage(
      isUser: true,
      time: "9:44 AM",
      isAudio: true,
      audioDuration: "0:45",
    ),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add(
        ChatMessage(
          text: _messageController.text.trim(),
          isUser: true,
          time: "Now",
        ),
      );
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F6FA,
      ), // اللون الفاتح المايل للبنفسجي من الديزاين
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            // التاريخ (Today, 9:41 AM)
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                "Today, 9:41 AM",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 16.h),

            // منطقة الرسائل
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(_messages[index]);
                },
              ),
            ),

            // منطقة الإدخال اللي تحت
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // --- الـ Widgets الفرعية ---

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white, // أبيض نقي للـ AppBar
      elevation: 0,
      toolbarHeight: 80.h,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage: const AssetImage(
                  'assets/Background+Shadow.png',
                ), // تأكد من وضع صورة الـ AI
                backgroundColor: Colors.grey.shade200,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "AI Assistant",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Online",
            style: TextStyle(
              color: const Color(0xFF3D31FF),
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // صورة الـ AI جنب الرسالة بتاعته
          if (!message.isUser) ...[
            CircleAvatar(
              radius: 14.r,
              backgroundImage: const AssetImage('assets/Background+Shadow.png'),
              backgroundColor: Colors.grey.shade200,
            ),
            SizedBox(width: 8.w),
          ],

          // البابل نفسها
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: message.isUser ? null : Colors.white,
                    gradient: message.isUser
                        ? const LinearGradient(
                            colors: [
                              Color(0xFF90CAF9),
                              Color(0xFF6C63FF),
                            ], // التدرج الفاتح للغامق
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                      bottomLeft: message.isUser
                          ? Radius.circular(20.r)
                          : const Radius.circular(0),
                      bottomRight: message.isUser
                          ? const Radius.circular(0)
                          : Radius.circular(20.r),
                    ),
                    boxShadow: message.isUser
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ], // شادو خفيف لرسائل الـ AI
                  ),
                  child: message.isAudio
                      ? _buildAudioPlayer(message.audioDuration!)
                      : Text(
                          message.text,
                          style: TextStyle(
                            color: Colors
                                .black87, // التكست غامق في الحالتين حسب الديزاين
                            fontSize: 14.sp,
                            height: 1.5,
                          ),
                        ),
                ),
                SizedBox(height: 4.h),
                // الوقت وعلامة الصح
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.time,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10.sp,
                      ),
                    ),
                    if (message.isUser) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.done_all,
                        color: const Color(0xFF6C63FF),
                        size: 14.sp,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // تصميم الـ Audio Player
  Widget _buildAudioPlayer(String duration) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.play_arrow, color: Colors.white, size: 20.sp),
        ),
        SizedBox(width: 12.w),
        // شكل الموجات
        Row(
          children: List.generate(15, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              width: 3.w,
              height: (index % 3 == 0) ? 20.h : ((index % 2 == 0) ? 12.h : 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(2.r),
              ),
            );
          }),
        ),
        SizedBox(width: 12.w),
        Text(
          duration,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ).copyWith(bottom: 12.h + MediaQuery.of(context).padding.bottom),
      color: Colors.white, // خلفية بيضا للبار
      child: Row(
        children: [
          // أيقونة البلس (+)
          Icon(
            Icons.add_circle_outline,
            color: Colors.grey.shade400,
            size: 28.sp,
          ),
          SizedBox(width: 12.w),

          // حقل الإدخال الشفاف
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F7), // لون رمادي فاتح جداً
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic_none,
                    color: Colors.grey.shade400,
                    size: 22.sp,
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey.shade400,
                    size: 22.sp,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // زرار الإرسال المتدرج
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF90CAF9), Color(0xFF6C63FF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.send, color: Colors.white, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
