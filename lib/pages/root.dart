import 'package:week5challenge/pages/settings/settings.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../widgets/bottombar_item.dart';
import 'explore.dart';
import 'favorites.dart';
import 'home/home.dart';
import 'messaging/chats/chats_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": const HomePage(),
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": const ExplorePage(),
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": const FavoritesPage(),
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": const ChatsScreen(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": const SettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: _buildPage(),
      ),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
        (index) => _barItems[index]["page"],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 12, 1, 1),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: Colors.white,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
