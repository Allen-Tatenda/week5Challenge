import 'package:flutter/material.dart';

import '../theme/color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.data,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  final data;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: selected ? AppColor.primary : AppColor.cardColor,
              ),
              child: Icon(
                data["icon"],
                size: 25,
                color: selected ? AppColor.secondary : Colors.white38,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: selected ? AppColor.secondary : Colors.white38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
