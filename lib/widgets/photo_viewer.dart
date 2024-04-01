//
import 'dart:async';

import 'package:week5challenge/theme/color.dart';
import 'package:week5challenge/widgets/recommend_item.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryWidget extends StatefulWidget {
  PageController pageController;
  final List photoGallery;
  final int selectedPhoto;
  GalleryWidget({required this.photoGallery, this.selectedPhoto = 0})
      : pageController = PageController(initialPage: selectedPhoto);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.selectedPhoto;
  StreamController<String> imageUrl = StreamController<String>.broadcast();
  StreamController<int> photoIndex = StreamController<int>.broadcast();

  String urlImage = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: AppColor.secondary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Image ${index + 1}/${widget.photoGallery.length}',
                      style: const TextStyle(
                          color: AppColor.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<String>(
                stream: imageUrl.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    child: PhotoViewGallery.builder(
                        pageController: widget.pageController,
                        itemCount: widget.photoGallery.length,
                        builder: (context, index) {
                          final urlImage = widget.photoGallery[index]["image"];
                          if (snapshot.hasData) {
                            index = this.index;

                            final urlImage = snapshot.data.toString();

                            return PhotoViewGalleryPageOptions(
                              imageProvider: NetworkImage(urlImage),
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.contained * 4,
                            );
                          } else {
                            final urlImage =
                                widget.photoGallery[index]["image"];
                            return PhotoViewGalleryPageOptions(
                              imageProvider: NetworkImage(urlImage),
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.contained * 4,
                            );
                          }
                        },
                        onPageChanged: (index) {
                          setState(() => this.index = index);
                          imageUrl.sink
                              .add(widget.photoGallery[index]["image"]);
                          photoIndex.sink.add(index);
                        }),
                  );
                }),
            Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: _buildPhotos()),
          ],
        ),
      );

  Widget _buildPhotos() {
    final recommendedData = widget.photoGallery;
    return CarouselSlider(
      options: CarouselOptions(
        height: 80,
        aspectRatio: 1 / 17,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .15,
        enlargeFactor: 0.4,
        enableInfiniteScroll: false,
        animateToClosest: true,
        initialPage: widget.selectedPhoto,
        onPageChanged: (index, reason) {
          setState(() {
            this.index = index;
            imageUrl.sink.add(recommendedData[index]["image"]);
          });
        },
      ),
      items: List.generate(
        recommendedData.length,
        (index) => Container(
          height: 80,
          width: 80,
          child: InkWell(
            onTap: () {
              setState(() {
                this.index = index;
                imageUrl.sink.add(recommendedData[index]["image"]);
              });
            },
            child: Image.network(
              recommendedData[index]["image"],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
