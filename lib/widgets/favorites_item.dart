import 'package:flutter/material.dart';

import '../pages/car_details/car_profile.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../utils/supabase_data.dart';
import 'custom_image.dart';
import 'icon_box.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.black54,
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
        child: Row(
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
                data["furniture"]["cover_image"],
                radius: 20,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: _buildInfo(),
            ),
            Expanded(
              child: Text(
                '${data["furniture"]["description"].toString()}',
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: AppColor.darker),
              ),
            ),
            Positioned(child: _buildFavorite())
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data["furniture"]["item"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '${data["furniture"]["category"].toString()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: AppColor.darker),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '\$${data["furniture"]["price"].toString()}',
          style: const TextStyle(
            fontSize: 13,
            color: AppColor.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
