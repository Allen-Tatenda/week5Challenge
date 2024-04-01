import 'package:flutter/material.dart';

import '../theme/color.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    Key? key,
    required this.data,
    this.bgColor = Colors.white,
    this.color = AppColor.primary,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  final data;
  final Color bgColor;
  final Color color;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 170,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50, // Set the radius to half of the image width/height
              backgroundImage: NetworkImage(
                data["image"],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              data["name"],
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w500, color: color),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: selected,
              child: Container(
                width: double.infinity,
                height: 2,
                //decoration: const BoxDecoration(color: AppColor.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
