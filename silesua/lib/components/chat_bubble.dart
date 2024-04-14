import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messages;
  final Color bubbleColor;

  const ChatBubble({
    Key? key,
    required this.messages,
    required this.bubbleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bubbleColor,
      ),
      child: Text(
        messages,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
