// import 'package:flutter/material.dart';

// import '../theme/color.dart';
// import '../utils/data.dart';
// import '../widgets/company_item.dart';
// import '../widgets/custom_textbox.dart';
// import '../widgets/icon_box.dart';
// import '../widgets/messages_page_item.dart';

// class MessagesPage extends StatefulWidget {
//   const MessagesPage({Key? key}) : super(key: key);

//   @override
//   _MessagesPageState createState() => _MessagesPageState();
// }

// class _MessagesPageState extends State<MessagesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverAppBar(
//           backgroundColor: AppColor.appBgColor,
//           pinned: true,
//           snap: true,
//           floating: true,
//           title: _buildHeader(),
//         ),
//         SliverToBoxAdapter(child: _buildBody())
//       ],
//     );
//   }

//   _buildHeader() {
//     return Row(
//       children: const [
//         Expanded(
//           child: CustomTextBox(
//             hint: "Search",
//             prefix: Icon(Icons.search, color: Colors.grey),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         IconBox(
//           bgColor: AppColor.secondary,
//           radius: 10,
//           child: Icon(Icons.filter_list_rounded, color: Colors.white),
//         )
//       ],
//     );
//   }

//   _buildBody() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 15),
//             child: Text(
//               "Top Sellers",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.secondary),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           _buildCompanies(),
//           const SizedBox(
//             height: 20,
//           ),
//           _buildMessages(),
//           const SizedBox(
//             height: 100,
//           ),
//         ],
//       ),
//     );
//   }

//   // int _selectedCategory = 0;
//   // _buildCompanies() {
//   //   List<Widget> lists = List.generate(
//   //     companies.length,
//   //     (index) => CompanyItem(
//   //       data: companies[index],
//   //       color: AppColor.listColors[index % 10],
//   //       selected: index == _selectedCategory,
//   //       onTap: () {
//   //         setState(() {
//   //           _selectedCategory = index;
//   //         });
//   //       },
//   //     ),
//   //   );

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.only(bottom: 5, left: 15),
//       child: Row(children: lists),
//     );
//   }

//   _buildMessages() {
//     List<Widget> lists = List.generate(
//       brokers.length,
//       (index) => MessagePageItem(
//         data: messagesHeaders[index],
//       ),
//     );

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(children: lists),
//     );
//   }
// }
