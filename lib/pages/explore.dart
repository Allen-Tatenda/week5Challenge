import 'dart:async';

import 'package:week5challenge/utils/supabase_data.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/favorites_item.dart';
import '../widgets/icon_box.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  StreamController<Future<List>> searching =
      StreamController<Future<List>>.broadcast();
  TextEditingController searchController = TextEditingController();

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

  _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.mainColor,
              hintStyle: const TextStyle(color: AppColor.secondary),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColor.secondary,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(2),
              ),
              hintText: "Search here",
            ),
            style: const TextStyle(color: AppColor.secondary),
            controller: searchController,
            onChanged: (String searchQuery) {
              setState(() {
                isloading = true;
              });
              searchResults = SupabaseData().getSearch(searchQuery);
              searching.sink.add(searchResults);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const IconBox(
          child: Icon(Icons.filter_list_rounded, color: Colors.white),
          bgColor: AppColor.secondary,
          radius: 10,
        )
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
          _buildFavorites(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildFavorites() {
    return StreamBuilder<Future<List>>(
        stream: searching.stream,
        builder: (context, snapshot) {
          return FutureBuilder(
              future: searchResults,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Cant Connect to Internet.',
                        style: TextStyle(color: AppColor.secondary),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    isloading = false;
                    if (searchController.text == '') {
                      return const Center(
                        child: Text(
                          '',
                          style: TextStyle(color: AppColor.secondary),
                        ),
                      );
                    }
                    if (snapshot.data.length <= 0) {
                      if (searchController.text.isNotEmpty) {
                        return const Center(
                          child: Text(
                            'No results matching your search.',
                            style: TextStyle(color: AppColor.secondary),
                          ),
                        );
                      }
                    } else {
                      final recentsData = snapshot.data;
                      List<Widget> lists = List.generate(
                        recentsData.length,
                        (index) => FavoriteItem(
                          data: recentsData[index],
                        ),
                      );

                      return Column(
                        children: [
                          Text(
                            '${recentsData.length.toString()} results found.',
                            style: const TextStyle(
                                color: AppColor.secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(bottom: 5, left: 15),
                            child: Column(children: lists),
                          ),
                        ],
                      );
                    }
                  }
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.secondary,
                ));
              });
        });
  }
}
