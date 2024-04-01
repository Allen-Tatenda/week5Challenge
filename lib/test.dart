// import 'package:flutter/material.dart';

// import 'main.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   // Persisting the future as local variable to prevent refetching upon rebuilds.
//   final SupabaseStreamBuilder _stream =
//       supabase.from('cars').stream(primaryKey: ['id']);

//   realtimePostgresChanges() async {
//     final myChannel = supabase.channel('my_channel');

//     myChannel.on(
//         RealtimeListenTypes.postgresChanges,
//         ChannelFilter(
//           event: '*',
//           schema: 'public',
//           table: 'cars',
//         ), (payload, [ref]) {
//       // Do something fun or interesting when there is an change on the database
//       print('car added : $payload');
//     }).subscribe();
//   }

//   realTimeBroadcast() async {
//     final myChannel = supabase.channel('my_channel');

// // Subscribe to `cursor-pos` broadcast event
//     myChannel
//         .on(RealtimeListenTypes.broadcast, ChannelFilter(event: 'cursor-pos'),
//             (payload, [ref]) {
//       // Do something fun or interesting when there is an change on the database
//       //send a message and wait for a change on database to update tick
//     }).subscribe();

// // Send a broadcast message to other connected clients
//     await myChannel.send(
//       type: RealtimeListenTypes.broadcast,
//       event: 'cursor-pos',
//       payload: {'x': 30, 'y': 50},
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     realtimePostgresChanges();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Map<String, dynamic>>>(
//       stream: _stream,
//       builder: (context, snapshot) {
//         return Text(snapshot.data.toString());
//       },
//     );
//   }
// }
