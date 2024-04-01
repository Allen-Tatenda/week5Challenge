import 'package:week5challenge/pages/car_details/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/color.dart';

List<String> imgArray = [
  "https://images.unsplash.com/photo-1519245659620-e859806a8d3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1571607388263-1044f9ea01dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=795&q=80",
  "https://images.unsplash.com/photo-1600510424051-30d592a75353?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1552176625-e47ff529b595?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
  "https://images.unsplash.com/photo-1621285915424-b8ac3dfd2a0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1632479803237-53e868bb2133?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80"
];

class DealerProfile extends StatelessWidget {
  TextEditingController search = TextEditingController();

  DealerProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Nissan Note",
          transparent: true,
          getCurrentPage: () {},
          searchController: search,
          searchOnChanged: () {},
          tags: const [],
        ),
        backgroundColor: AppColor.primary,
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1530906358829-e84b2769270f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80"),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: <Widget>[
                          SafeArea(
                            bottom: false,
                            right: false,
                            left: false,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://scontent.fhre1-1.fna.fbcdn.net/v/t31.18172-8/30806193_1733216346737346_7068341401572357511_o.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=jK54VgQhLUUAX_crY3S&_nc_ht=scontent.fhre1-1.fna&oh=00_AfBST07Dqgyk8jPsb2V_4tpQfNU2TZ6_O4Imfp6jEbiXnA&oe=6481CAF8"),
                                      radius: 65.0),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 24.0),
                                    child: Text("Allen Njiva",
                                        style: TextStyle(
                                            color: AppColor.secondary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Car Dealer",
                                        style: TextStyle(
                                            color: AppColor.orange
                                                .withOpacity(0.85),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, left: 42, right: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("2.4 ltr",
                                                style: TextStyle(
                                                    color: AppColor.blue,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Fuel Consumption",
                                                style: TextStyle(
                                                    color: AppColor.blue
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("2.6 hp",
                                                style: TextStyle(
                                                    color: AppColor.darker,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Engine Capacity",
                                                style: TextStyle(
                                                    color: AppColor.green
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("280 km/h",
                                                style: TextStyle(
                                                    color: AppColor.red,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Maximun Speed",
                                                style: TextStyle(
                                                    color: AppColor.pink
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                const Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding:
                        EdgeInsets.only(left: 32.0, right: 32.0, top: 42.0),
                    child: Column(children: [
                      Text("Location",
                          style: TextStyle(
                              color: AppColor.secondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, right: 24, top: 30, bottom: 24),
                        child: Text(
                            "An artist of considerable range, Ryan - the name taken by Meblourne-raised, Brooklyn-based Nick Murphy - writes, performs and records all of his own music.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColor.green)),
                      ),
                      //PhotoAlbum(imgArray: imgArray)
                    ]),
                  )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        //textColor: NowUIColors.white,
                        //color: NowUIColors.info,
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        // shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(32.0),
                        //),
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            child: Text("Follow",
                                style: TextStyle(fontSize: 13.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: RawMaterialButton(
                        constraints: BoxConstraints.tight(const Size(38, 38)),
                        onPressed: () {},
                        elevation: 4.0,
                        fillColor: AppColor.primary,
                        padding: const EdgeInsets.all(0.0),
                        shape: const CircleBorder(),
                        child: const Icon(Icons.favorite,
                            size: 20, color: AppColor.secondary),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: RawMaterialButton(
                        constraints: BoxConstraints.tight(const Size(38, 38)),
                        onPressed: () {},
                        elevation: 4.0,
                        fillColor: AppColor.primary,
                        padding: const EdgeInsets.all(0.0),
                        shape: const CircleBorder(),
                        child: const Icon(FontAwesomeIcons.sms,
                            size: 20, color: AppColor.secondary),
                      ),
                    ),
                    RawMaterialButton(
                      constraints: BoxConstraints.tight(const Size(38, 38)),
                      onPressed: () {},
                      elevation: 4.0,
                      fillColor: AppColor.primary,
                      padding: const EdgeInsets.all(0.0),
                      shape: const CircleBorder(),
                      child: const Icon(FontAwesomeIcons.facebookMessenger,
                          size: 20, color: AppColor.secondary),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
