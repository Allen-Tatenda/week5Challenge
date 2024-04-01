import 'package:week5challenge/theme/color.dart';
import 'package:flutter/material.dart';
import '../../../models/ChatMessage.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  final String senderId;
  final String message;
  const Message({required this.message, required this.senderId});

  //final SupabaseMessage message;

  @override
  Widget build(BuildContext context) {
    // Widget messageContaint(SupabaseMessage message) {
    //   switch (message.messageType) {
    //     case ChatMessageType.text:
    //       return TextMessage(message: message);
    //     case ChatMessageType.audio:
    //       return AudioMessage(message: message);
    //     case ChatMessageType.video:
    //       return const VideoMessage();
    //     default:
    //       return const SizedBox();
    //   }
    // }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            senderId == '' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (senderId != '') ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message, senderId),
          //if (senderId == '') MessageStatusDot(status: message)
        ],
      ),
    );
  }

  messageContaint(message, senderId) {
    return TextMessage(
      message: message,
      senderId: senderId,
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return AppColor.secondary;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
