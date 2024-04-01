import 'package:week5challenge/theme/color.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({required this.message, required this.senderId});

  final String senderId;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: AppColor.appBgColor.withOpacity(senderId == '' ? 0.51 : 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.toString(),
        style: const TextStyle(
          color: AppColor.textBoxColor,
        ),
      ),
    );
  }
}
