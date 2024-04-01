import 'package:google_fonts/google_fonts.dart';
import 'package:week5challenge/pages/product_details/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/color.dart';
import '../../utils/data.dart';
import '../../widgets/photo_viewer.dart';

class ProductDetails extends StatefulWidget {
  final data;
  ProductDetails({super.key, required this.data});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController search = TextEditingController();

  List photoGallery = [];

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: widget.data["item"],
          transparent: true,
          getCurrentPage: () {},
          searchController: search,
          searchOnChanged: () {},
          tags: const [],
        ),
        bottomNavigationBar: BottomBar(
          price: widget.data['price'],
        ),
        backgroundColor: AppColor.primary,
        body: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.data["cover_image"]),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                                width: 297,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColor.cardColor.withOpacity(.7),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: _buildPhotos(),
                                )),
                          ),
                        ]),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${widget.data['price'].toString()}',
                                  style: GoogleFonts.poppins(
                                      color: AppColor.darker,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '4.5',
                                      style: GoogleFonts.aBeeZee(
                                          color: AppColor.darker,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.data['item'],
                              style: GoogleFonts.aBeeZee(
                                  color: AppColor.appBgColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Product Details',
                              style: GoogleFonts.aBeeZee(
                                  color: AppColor.appBgColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.data['description'],
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(199, 255, 255, 255),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: AppColor.darker,
                              thickness: 0.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Select Color : ',
                                  style: GoogleFonts.aBeeZee(
                                      color: AppColor.appBgColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Brown',
                                  style: GoogleFonts.aBeeZee(
                                      color: AppColor.darker,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: AppColor.appBgColor,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildPhotos() {
    return FutureBuilder(
      future: selectedCarPhotos,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error loading photos, ',
                  style: TextStyle(color: AppColor.darker),
                ),
                Text(
                  'Retry',
                  style: TextStyle(color: AppColor.secondary),
                ),
              ],
            ));
          } else if (snapshot.hasData) {
            if (snapshot.data.length < 1) {
              return const SizedBox.shrink();
            }
            final photos = snapshot.data;
            photoGallery = snapshot.data;
            int items = 0;
            int offset = 0;
            if (snapshot.data.length > 4) {
              items = 5;
              offset = snapshot.data.length - items;
            }

            for (int i = 0; i < items; i++) {}
            return SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 28,
                child: ListView.builder(
                    itemCount: items,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      if (index == (items - 1)) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: InkWell(
                              onTap: () {
                                openPhotoGallery(index);
                              },
                              child: SmallPhotoLast(
                                photos: photos,
                                index: index,
                                offset: offset,
                              )),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: InkWell(
                            onTap: () {
                              openPhotoGallery(index);
                            },
                            child: SmallPhoto(
                              photos: photos,
                              index: index,
                            )),
                      );
                    })));
          }
        }
        return const Center(
            child: CircularProgressIndicator(
          color: AppColor.secondary,
        )); // while the future is loading
      },
    );
  }

  void openPhotoGallery(selectedPhoto) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => GalleryWidget(
                photoGallery: photoGallery,
                selectedPhoto: selectedPhoto,
              )));
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.price,
  });
  final int price;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2,
      shadowColor: AppColor.appBgColor,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: AppColor.cardColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: GoogleFonts.aBeeZee(
                        color: AppColor.darker,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    '\$ ${price.toString()}',
                    style: GoogleFonts.aBeeZee(
                        color: AppColor.appBgColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.shoppingBasket,
                        color: AppColor.cardColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add to Cart ',
                        style: GoogleFonts.aBeeZee(
                            color: AppColor.cardColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SmallPhoto extends StatelessWidget {
  const SmallPhoto({
    super.key,
    required this.photos,
    required this.index,
  });

  final List photos;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        (photos[index]['image']),
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SmallPhotoLast extends StatelessWidget {
  const SmallPhotoLast(
      {super.key,
      required this.photos,
      required this.index,
      required this.offset});

  final List photos;
  final int index;
  final int offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(photos[index]['image']), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.cardColor.withOpacity(.6),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            '+$offset',
            style: const TextStyle(color: AppColor.appBgColor, fontSize: 16),
          ))),
    );
  }
}
