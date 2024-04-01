import 'package:week5challenge/pages/settings/widgets/settings_items.dart';
import 'package:week5challenge/theme/color.dart';
import 'package:week5challenge/utils/data.dart';
import 'package:flutter/material.dart';

class SettingsGroup extends StatefulWidget {
  final groupName;
  const SettingsGroup({super.key, required this.groupName});

  @override
  State<SettingsGroup> createState() => _SettingsGroupState();
}

class _SettingsGroupState extends State<SettingsGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: settingsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return SettingsItem(
                  icon: settingsItems[index]["icon"],
                  title: settingsItems[index]["title"],
                  subtitle: settingsItems[index]["subtitle"],
                  route: settingsItems[index]["route"],
                  is_switch: settingsItems[index]["is_switch"],
                  is_switch_on: settingsItems[index]["is_switch_on"],
                  action: settingsItems[index]["action"],
                );
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
