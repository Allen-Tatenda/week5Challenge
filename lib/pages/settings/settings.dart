import 'package:week5challenge/pages/settings/widgets/account_items.dart';
import 'package:week5challenge/pages/settings/widgets/big_card.dart';
import 'package:week5challenge/pages/settings/widgets/contact_us.dart';
import 'package:week5challenge/pages/settings/widgets/settings_group.dart';
import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondary),
                ),
              ),
              BigCard(),
              SettingsGroup(
                groupName: 'Settings',
              ),
              ContactUsItems(),
              AccountItems(),
              SizedBox(
                height: 60,
              )
            ])));
  }
}
