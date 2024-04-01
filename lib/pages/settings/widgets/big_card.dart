import 'package:flutter/material.dart';
import '../../../theme/color.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mediaQueryHeight / 4,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(double.parse(10.toString())),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: AppColor.appBgColor.withOpacity(.1),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 400,
              backgroundColor: AppColor.blue.withOpacity(.05),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // User profile
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        foregroundColor: Colors.black87,
                        radius: mediaQueryHeight / 18,
                        foregroundImage: const NetworkImage(
                            'https://scontent.fhre1-1.fna.fbcdn.net/v/t31.18172-8/30806193_1733216346737346_7068341401572357511_o.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=1y-_h3wfquUAX_oO2Je&_nc_ht=scontent.fhre1-1.fna&oh=00_AfAKbNzrHVGKcmKUJHrQWkf_bUj6UOk41Am8IvIgHKgCXw&oe=647F6038'),
                        child: const Icon(Icons.person),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Allen Njiva',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mediaQueryHeight / 30,
                              color: AppColor.appBgColor,
                            ),
                          ),
                          Text(
                            'anjiva7@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mediaQueryHeight / 60,
                              color: AppColor.appBgColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.cardColor,
                    ),
                    child: Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          'Modify',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          'Tap to Edit Your Profile',
                          style: TextStyle(color: AppColor.darker),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(
                          Icons.navigate_next,
                          color: AppColor.secondary,
                        ),
                      ),
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
