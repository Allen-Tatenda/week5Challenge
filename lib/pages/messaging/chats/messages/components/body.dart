import 'package:flutter/material.dart';
import '../../../../../theme/color.dart';
import 'chat_input_field.dart';
import 'message.dart';
import 'package:supabase/src/supabase_stream_builder.dart';

class Body extends StatelessWidget {
  final SupabaseStreamBuilder stream;
  const Body({required this.stream});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        //     child: ListView.builder(
        //       itemCount: demeChatMessages.length,
        //       itemBuilder: (context, index) =>
        //           Message(message: demeChatMessages[index]),
        //     ),
        //   ),
        // ),
        _buildMessages(),
        const ChatInputField(),
      ],
    );
  }

  Widget _buildMessages() {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Error loading Messages, ',
                style: TextStyle(color: AppColor.darker),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Retry',
                  style: TextStyle(color: AppColor.secondary),
                ),
              ),
            ],
          ));
        }
        if (snapshot.hasData) {
          print(snapshot.data);
          final messages = snapshot.data;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Message(
                  message: messages[index]['message'].toString(),
                  senderId: '',
                ),
              ),
            ),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: AppColor.secondary,
        ));
      },
    );
  }
}
