import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../pages/car_details/car_profile.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../utils/supabase_data.dart';
import 'custom_image.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarProfile(
                              data: data,
                            )));
                selectedCarPhotos =
                    SupabaseData().getSelectedCarPhotos(data["id"]);
              },
              child: CustomImage(
                data["cover_image"],
                width: 150,
                height: 150,
                radius: 25,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: _buildFavorite(
              data["id"],
            ),
          ),
          Positioned(
            left: 15,
            top: 160,
            child: _buildInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildFavorite(carId) {
    return
        // Text(likes.toString());

        FutureBuilder(
            future: favorites,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return LikeButton(
                countPostion: CountPostion.bottom,
                size: 30,
                circleColor: const CircleColor(
                    start: AppColor.secondary, end: AppColor.pink),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor:
                      AppColor.blue, // Convert nullable to non-nullable
                  dotSecondaryColor: AppColor.green,
                  dotThirdColor: AppColor.orange,
                  dotLastColor: AppColor.secondary,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: AppColor.secondary,
                    size: 25,
                  );
                },
                likeCount: snapshot.data,
              );
            });

    // IconBox(
    //   bgColor: Colors.transparent,
    //   child: Icon(
    //     (data["is_favorited"] != null) ? Icons.favorite : Icons.favorite_border,
    //     color: AppColor.secondary,
    //     size: 30,
    //   ),
    // );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${data["item"]} ${data["price"]}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.place_outlined,
              color: AppColor.darker,
              size: 13,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              data['price'].toString(),
              style: const TextStyle(fontSize: 13, color: AppColor.darker),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '\$ ${data["price"].toString()}',
          style: const TextStyle(
            fontSize: 15,
            color: AppColor.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
