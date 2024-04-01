import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/color.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool reverseTextcolor;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final bool isOnSearch;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  const Navbar(
      {super.key,
      this.title = "",
      this.categoryOne = "",
      this.categoryTwo = "",
      required this.tags,
      this.transparent = false,
      this.rightOptions = true,
      this.reverseTextcolor = false,
      required this.getCurrentPage,
      required this.searchController,
      this.isOnSearch = false,
      required this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = AppColor.primary,
      this.searchBar = false});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  late String activeTag;

  @override
  void initState() {
    if (widget.tags != null && widget.tags.isNotEmpty) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final bool tagsExist =
        widget.tags == null ? false : (widget.tags.isEmpty ? false : true);

    return Container(
        height: widget.searchBar
            ? (!categories
                ? (tagsExist ? 211.0 : 178.0)
                : (tagsExist ? 262.0 : 210.0))
            : (!categories
                ? (tagsExist ? 162.0 : 42.0)
                : (tagsExist ? 200.0 : 150.0)),
        decoration: BoxDecoration(
            color: AppColor.appBgColor.withOpacity(.0),
            boxShadow: const [
              BoxShadow(
                  color: AppColor.shadowColor,
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.appBgColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back_outlined,
                              color: AppColor.secondary, size: 24.0),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    const Text('Product Details',
                        style: TextStyle(
                            color: AppColor.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.appBgColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Notifications()));
                        },
                        child: const IconButton(
                            icon: Icon(FontAwesomeIcons.heart,
                                size: 25, color: AppColor.secondary),
                            onPressed: null),
                      ),
                    )
                  ],
                ))));
  }
}
