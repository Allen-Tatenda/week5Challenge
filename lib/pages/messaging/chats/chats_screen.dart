import 'package:flutter/material.dart';

import '../../../theme/color.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.secondary,
        child: const Icon(
          Icons.person_add_alt_1,
          color: AppColor.appBgColor,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.cardColor,
      automaticallyImplyLeading: false,
      title: const Text(
        "Chats",
        style: TextStyle(color: AppColor.secondary),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AppColor.secondary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
