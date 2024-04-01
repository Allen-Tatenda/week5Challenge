import 'package:flutter/material.dart';

import '../pages/car_details/car_profile.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../utils/supabase_data.dart';
import 'custom_image.dart';
import 'icon_box.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 130,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          GestureDetector(
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
              data["car_image"],
              radius: 20,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          GestureDetector(
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
              child: _buildOverlay()),
          Positioned(
            bottom: 12,
            left: 10,
            child: _buildInfo(),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: _buildFavorite(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(.8),
            Colors.white.withOpacity(.01),
          ],
        ),
      ),
    );
  }

  Widget _buildFavorite() {
    return IconBox(
      bgColor: Colors.transparent,
      child: Icon(
        (data["is_favorited"] != null) ? Icons.favorite : Icons.favorite_border,
        color: AppColor.secondary,
        size: 30,
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
          backgroundBlendMode: BlendMode.saturation),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data["manufacturer"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Row(
            children: [
              const Icon(
                Icons.place_outlined,
                color: Colors.white,
                size: 13,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                data['user_profile']['city'],
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
