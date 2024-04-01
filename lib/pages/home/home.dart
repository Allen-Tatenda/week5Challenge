import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:week5challenge/pages/home/widgets/new_collections.dart';
import 'package:week5challenge/utils/supabase_data.dart';
import 'package:week5challenge/widgets/icon_box.dart';
import '../../main.dart';
import '../../theme/color.dart';
import '../../utils/data.dart';
import '../../widgets/category_item.dart';
import '../../widgets/property_item.dart';
import '../../widgets/recent_item.dart';
import '../../widgets/recommend_item.dart';
import 'package:supabase/src/supabase_stream_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SupabaseStreamBuilder _stream =
      supabase.from('furniture').stream(primaryKey: ['id']);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.mainColor,
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
    return const Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    color: AppColor.textBoxColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 20,
                    ),
                    Text(
                      'Harare, ZW',
                      style: TextStyle(
                        color: AppColor.bottomBarColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.notifications_on_rounded,
              color: Colors.white70,
            ),
          ])
    ]);
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: _buildSearch(),
          ),
          const NewCollections(),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darker),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: AppColor.secondary),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildCategories(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Flash Sale',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darker),
                ),
                Row(
                  children: [
                    const Text(
                      'Closing in',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: AppColor.inActiveColor),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '12',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.inActiveColor),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: AppColor.inActiveColor),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '30',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.inActiveColor),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: AppColor.inActiveColor),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '10',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.inActiveColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 5, left: 0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.inActiveColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Newest',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.inActiveColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.appBgColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Bedroom',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.inActiveColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Lounge',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.inActiveColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.cardColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Kitchen',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.inActiveColor),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          _buildPopulars(),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

  int _selectedCategory = 0;
  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 0),
      child: Row(children: lists),
    );
  }

  Widget _buildPopulars() {
    return StreamBuilder(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Error loading populars, ',
                style: TextStyle(color: AppColor.darker),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Text(
                  'Retry',
                  style: TextStyle(color: AppColor.secondary),
                ),
              ),
            ],
          ));
        }
        if (snapshot.hasData) {
          final popularsList = snapshot.data;

          return Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                height: 150,
                child: ListView.builder(
                    itemCount: popularsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 12,
                        height: 150,
                        child: PropertyItem(
                          data: popularsList[index],
                        ),
                      );
                    })),
              ),
            ],
          );
        }

        return const Center(
            child: CircularProgressIndicator(
          color: AppColor.secondary,
        ));
      },
    );
  }

  _buildSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.cardColor,
              hintStyle: const TextStyle(color: AppColor.secondary),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColor.secondary,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: "Search here",
            ),
            style: const TextStyle(color: AppColor.secondary),
            //controller: searchController,
            onChanged: (String searchQuery) {
              setState(() {
                isloading = true;
              });
              searchResults = SupabaseData().getSearch(searchQuery);
              //searching.sink.add(searchResults);
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
}
