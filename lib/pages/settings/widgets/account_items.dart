import 'package:week5challenge/pages/settings/widgets/settings_items.dart';
import 'package:week5challenge/theme/color.dart';
import 'package:week5challenge/utils/data.dart';
import 'package:flutter/material.dart';

class AccountItems extends StatefulWidget {
  const AccountItems({super.key});

  @override
  State<AccountItems> createState() => _AccountItemsState();
}

class _AccountItemsState extends State<AccountItems> {
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
              itemCount: contactUsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return SettingsItem(
                  icon: accountSettingsItems[index]["icon"],
                  title: accountSettingsItems[index]["title"],
                  subtitle: accountSettingsItems[index]["subtitle"],
                  route: accountSettingsItems[index]["route"],
                  is_switch: accountSettingsItems[index]["is_switch"],
                  is_switch_on: accountSettingsItems[index]["is_switch_on"],
                  action: accountSettingsItems[index]["action"],
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
