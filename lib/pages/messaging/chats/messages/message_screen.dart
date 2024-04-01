import 'package:week5challenge/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../main.dart';
import 'components/body.dart';
import 'package:supabase/src/supabase_stream_builder.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final SupabaseStreamBuilder _messageStream = supabase
      .from('messages')
      .stream(primaryKey: ['id']).eq(
          'sender_id', 'def71122-d198-43d0-9807-316ea1fee91e');

  messagesChanges() async {
    final myChannel = supabase.channel('message');

    myChannel.on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: '*',
          schema: 'public',
          table: 'messages',
        ), (payload, [ref]) {
      if (payload.data &&
          (payload.data).group_id == supabase.auth.currentUser!.id) {
        print('PayLoad ${payload.newRecord!}');
      }
      // Do something fun or interesting when there is an change on the database
      print('PayLoad ${payload['data']}');
    }).subscribe();
  }

  @override
  void initState() {
    super.initState();
    messagesChanges();
    print(_messageStream.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: buildAppBar(),
      body: Body(
        stream: _messageStream,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.cardColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Jenny Wilson",
                style: TextStyle(fontSize: 16, color: AppColor.secondary),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12, color: AppColor.darker),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.local_phone,
            color: AppColor.secondary,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.videocam,
            color: AppColor.secondary,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
