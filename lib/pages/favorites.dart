import 'package:flutter/material.dart';
import 'package:week5challenge/main.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/custom_image.dart';
import '../widgets/favorites_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.cardColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorites',
                  style: const TextStyle(
                    color: AppColor.secondary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildFavorites(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildFavorites() {
    return FutureBuilder(
        future: myFavorites,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(
                child: Text(
                  'Failed to fetch favorites',
                  style: TextStyle(color: AppColor.secondary),
                ),
              );
            }
            if (snapshot.hasData) {
              final recentsData = snapshot.data;
              List<Widget> lists = List.generate(
                recentsData.length,
                (index) => FavoriteItem(
                  data: recentsData[index],
                ),
              );
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(bottom: 5, left: 15),
                child: Column(children: lists),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.secondary,
            ),
          );
        });
  }
}
