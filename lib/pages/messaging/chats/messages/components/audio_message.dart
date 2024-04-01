import 'package:flutter/material.dart';

import '../../../../../theme/color.dart';
import '../../../models/ChatMessage.dart';

class AudioMessage extends StatelessWidget {
  final SupabaseMessage? message;

  const AudioMessage({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            AppColor.appBgColor.withOpacity(message!.senderId == '' ? 0.51 : 1),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            color: AppColor.secondary,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColor.secondary.withOpacity(0.2),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: AppColor.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Text(
            "0.37",
            style: TextStyle(fontSize: 12, color: AppColor.secondary),
          ),
        ],
      ),
    );
  }
}
