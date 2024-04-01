import 'package:week5challenge/main.dart';
import 'package:week5challenge/pages/auth/splash_screen.dart';
import 'package:week5challenge/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:week5challenge/widgets/progress_dialog.dart';

class SettingsItem extends StatelessWidget {
  final title;
  final subtitle;
  final icon;
  final route;
  final is_switch;
  final is_switch_on;
  final action;
  const SettingsItem(
      {required this.icon,
      required this.action,
      required this.route,
      required this.subtitle,
      required this.title,
      required this.is_switch,
      this.is_switch_on});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
          onTap: () async {
            action;
            print(action);
            print("signingout");
            if (title == 'Signout') {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext c) {
                    return ProgressDialog(
                      message: "Processing, Please wait...",
                    );
                  });
              await supabase.auth.signOut();
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MySplashScreen()));
            }
          },
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(
              icon,
              size: 25,
              color: AppColor.darker,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.secondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: const TextStyle(color: AppColor.darker),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : const SizedBox(),
          trailing: (is_switch == false)
              ? const Icon(
                  Icons.navigate_next,
                  color: AppColor.darker,
                )
              : Switch.adaptive(
                  value: is_switch_on,
                  activeColor: AppColor.secondary,
                  thumbColor:
                      MaterialStateProperty.all<Color>(AppColor.secondary),
                  trackColor: MaterialStateProperty.all<Color>(AppColor.darker),
                  onChanged: (value) {
                    // do something
                  })),
    ));
  }
}
