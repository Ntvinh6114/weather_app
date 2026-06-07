import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    // Dùng GestureDetector bọc ngoài cùng để bắt sự kiện chạm
    return GestureDetector(
      // BẤM VÀO KHOẢNG TRỐNG ĐỂ ẨN BÀN PHÍM
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        // TÍNH NĂNG QUAN TRỌNG NHẤT: Tự động co bóp giao diện đẩy lên trên bàn phím
        resizeToAvoidBottomInset: true,

        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("Trợ lý Thời tiết"),
          centerTitle: true,
        ),

        // Dùng SafeArea để bảo vệ nội dung không bị dính vào tai thỏ/thanh điều hướng
        body: SafeArea(
          child: Obx(() {
            if (!controller.isLoggedIn.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, size: 60, color: isDark ? Colors.grey[500] : Colors.grey[400]),
                    const SizedBox(height: 16),
                    Text("Vui lòng đăng nhập để sử dụng Trợ lý AI",
                      style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.grey[300] : Colors.black54
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => Get.toNamed('/login'),
                      icon: const Icon(Icons.login),
                      label: const Text("Đăng nhập ngay"),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                // 1. DANH SÁCH TIN NHẮN
                Expanded(
                  // Bọc ListView bằng GestureDetector để khi vuốt danh sách cũng ẩn bàn phím
                  child: GestureDetector(
                    onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    child: ListView.builder(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final chat = controller.messages[index];
                        bool isUser = chat['role'] == 'user';
                        String content = chat['content'] ?? (chat['message_text'] ?? "");

                        return Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: isUser ? theme.primaryColor : theme.secondaryHeaderColor,
                              boxShadow: isDark ? null : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20),
                                bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(0),
                                bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(20),
                              ),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.75,
                            ),
                            child: Text(
                              content,
                              style: TextStyle(
                                color: isUser ? Colors.white : (isDark ? Colors.white : Colors.black87),
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                if (controller.isSending.value)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(strokeWidth: 2, color: theme.primaryColor)
                          ),
                          const SizedBox(width: 10),
                          Text("Đang suy nghĩ...", style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600], fontSize: 13)),
                        ],
                      ),
                    ),
                  ),

                // 3. KHUNG NHẬP TEXT VÀ GỬI
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      boxShadow: isDark ? null : [
                        BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))
                      ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.chatTextController,
                          // Khi người dùng bấm vào ô này, bàn phím hiện lên sẽ tự đẩy Scaffold lên
                          decoration: const InputDecoration(
                            hintText: "Nhắn tin cho trợ lý...",
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          style: TextStyle(color: isDark ? Colors.white : Colors.black),
                          onSubmitted: (_) => controller.sendMessage(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 24,
                        child: IconButton(
                          icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                          onPressed: controller.isSending.value ? null : () => controller.sendMessage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}