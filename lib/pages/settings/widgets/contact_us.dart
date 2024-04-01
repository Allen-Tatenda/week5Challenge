import 'package:week5challenge/pages/settings/widgets/settings_items.dart';
import 'package:week5challenge/theme/color.dart';
import 'package:week5challenge/utils/data.dart';
import 'package:flutter/material.dart';

class ContactUsItems extends StatefulWidget {
  const ContactUsItems({super.key});

  @override
  State<ContactUsItems> createState() => _ContactUsItemsState();
}

class _ContactUsItemsState extends State<ContactUsItems> {
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
                  icon: contactUsItems[index]["icon"],
                  title: contactUsItems[index]["title"],
                  subtitle: contactUsItems[index]["subtitle"],
                  route: contactUsItems[index]["route"],
                  is_switch: contactUsItems[index]["is_switch"],
                  is_switch_on: contactUsItems[index]["is_switch_on"],
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
