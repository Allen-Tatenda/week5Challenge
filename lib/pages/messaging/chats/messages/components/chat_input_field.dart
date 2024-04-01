import 'package:week5challenge/main.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/color.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: AppColor.secondary.withOpacity(0.01),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: AppColor.secondary),
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: AppColor.secondary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: AppColor.secondary.withOpacity(0.64),
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            hintText: "Type message",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white30)),
                      ),
                    ),
                    messageController.text != ''
                        ? Row(
                            children: [
                              Icon(
                                Icons.attach_file,
                                color: AppColor.secondary.withOpacity(0.64),
                              ),
                              const SizedBox(width: kDefaultPadding / 4),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: AppColor.secondary.withOpacity(0.64),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () async {
                              await supabase.from('messages').insert({
                                'message': messageController.text,
                                'sender_id': supabase.auth.currentUser!.id,
                                'receiver_id':
                                    '2d120778-efef-42af-aa43-3814244e1970',
                              }).select();
                              messageController.text = '';
                            },
                            child: Icon(
                              Icons.send,
                              color: AppColor.secondary.withOpacity(0.64),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
