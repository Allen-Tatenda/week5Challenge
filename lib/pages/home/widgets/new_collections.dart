import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:week5challenge/theme/color.dart';

class NewCollections extends StatelessWidget {
  const NewCollections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int popularsList = 4;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 165,
              enlargeCenterPage: true,
              disableCenter: true,
              viewportFraction: 1,
              autoPlay: true),
          items: List.generate(
            popularsList,
            (index) => CollectionItem(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 18,
              width: 69,
              child: ListView.builder(
                  itemCount: popularsList,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: CorouselDot(),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }

  CorouselDot() {
    return Container(
      height: 18,
      width: 10,
      decoration: BoxDecoration(
          color: AppColor.darker, borderRadius: BorderRadius.circular(100)),
    );
  }

  CollectionItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        color: AppColor.cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Collection',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textBoxColor),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Discount 50% for the first transaction',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: AppColor.textBoxColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(colors: [
                        Colors.black,
                        AppColor.secondary,
                        Colors.black,
                      ]),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Shop Now',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColor.textBoxColor),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  child: Image.asset(
                    'assets/sofa.png',
                    fit: BoxFit.contain,
                    height: 140,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
