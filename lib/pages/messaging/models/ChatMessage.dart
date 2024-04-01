enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

// class ChatMessage {
//   final String text;
//   final ChatMessageType messageType;
//   final MessageStatus messageStatus;
//   final bool isSender;

//   ChatMessage({
//     this.text = '',
//     required this.messageType,
//     required this.messageStatus,
//     required this.isSender,
//   });
// }

class SupabaseMessage {
  final String message;
  final ChatMessageType messageType;
  final String senderId;
  final MessageStatus messageStatus;
  final DateTime timestamp;

  SupabaseMessage(
      {required this.senderId,
      required this.message,
      required this.messageStatus,
      required this.messageType,
      required this.timestamp});

  factory SupabaseMessage.fromJson(Map<String, dynamic> json) {
    return SupabaseMessage(
      message: json['message'] ?? '',
      messageType: json['message'],
      messageStatus: json['status'],
      senderId: json['sender_id'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'type': messageType,
        'timestamp': timestamp.toString(),
      };
}

List demeChatMessages = [
  SupabaseMessage(
      message: "Hi Sajol,",
      messageType: ChatMessageType.text,
      //messageStatus: MessageStatus.viewed,
      //isSender: false,
      timestamp: '21-02-02 00:00hrs' as DateTime,
      senderId: '',
      messageStatus: MessageStatus.viewed),
  // SupabaseMessage(
  //   text: "Hello, How are you?",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: true,
  // ),
  // SupabaseMessage(
  //   text: "",
  //   messageType: ChatMessageType.audio,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: false,
  // ),
  // SupabaseMessage(
  //   text: "",
  //   messageType: ChatMessageType.video,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: true,
  // ),
  // ChatMessage(
  //   text: "Error happend",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.not_sent,
  //   isSender: true,
  // ),
  // ChatMessage(
  //   text: "This looks great man!!",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.viewed,
  //   isSender: false,
  // ),
  // ChatMessage(
  //   text: "Glad you like it",
  //   messageType: ChatMessageType.text,
  //   messageStatus: MessageStatus.not_view,
  //   isSender: true,
  // ),
];
