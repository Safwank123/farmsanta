
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Models/Common/cardmodel.dart';
import 'package:farmsanta_new/Pages/Home/widgets/store_tile.dart';
import 'package:flutter/material.dart';
import '../../Services/store_helper.dart';
import '../base_screen.dart';

class ProductPage extends BaseScreen {
  static String routeName = '/product-page-screen';
  List<StoreCardModel?> storeList;

  ProductPage({super.key, required this.storeList});

  @override
  BaseScreenState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BaseScreenState<ProductPage> {
  final bool _pinned = true;
  final bool _snap = false;
  List<StoreCardModel?> filteredStoreList = StoreHelper.store.homeStoreList;
  String selectedFilter = AppStrings.all;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void updateFilteredStoreList(String filter) {
    setState(() {
      selectedFilter = filter;
      StoreHelper.store.homeStoreList = getFilteredStoreList(filter);
    });
  }

  List<StoreCardModel?> getFilteredStoreList(String filter) {
    switch (filter) {
      case 'All':
        return widget.storeList;
      case 'Category':
        // Implement filter logic here based on category
        // ...
        break;
      // case 'Rating':
      //   // Return storeList sorted by ratings in descending order
      //   return List.from(widget.storeList)..sort((a, b) => b?.ratings!.compareTo(a.ratings));
      // case 'Distance':
      //   // Return storeList sorted by distance in ascending order
      //   return List.from(widget.storeList)..sort((a, b) => a?.distance.compareTo(b.distance));
      default:
        // Return storeList as is
        return widget.storeList;
    }
    return widget.storeList;
  }

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              // floating: _floating,
              expandedHeight: 160.0,
              title: const Text(
                AppStrings.bestRatedStore,
                style: TextStyle(color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            //border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "${AppStrings.search}...",
                            fillColor: Colors.white70),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 15, right: 15, top: 5),
                        child: Wrap(
                          spacing: 8,
                          children: [
                            FilterChip(
                              label: const Text(AppStrings.all),
                              selected: selectedFilter == AppStrings.all,
                              onSelected: (selected) {
                                updateFilteredStoreList(AppStrings.all);
                              },
                            ),
                            FilterChip(
                              label: Text(AppStrings.category),
                              selected: selectedFilter == AppStrings.category,
                              onSelected: (selected) {
                                updateFilteredStoreList(AppStrings.category);
                              },
                            ),
                            FilterChip(
                              label: Text(AppStrings.rating),
                              selected: selectedFilter == AppStrings.rating,
                              onSelected: (selected) {
                                updateFilteredStoreList(AppStrings.rating);
                              },
                            ),
                            FilterChip(
                              label: Text(AppStrings.distance),
                              selected: selectedFilter == AppStrings.distance,
                              onSelected: (selected) {
                                updateFilteredStoreList(AppStrings.distance);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text(AppStrings.scrollToSeeTheSliverAppBarInEffect),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SizedBox(
                  child: StoreListTile(
                    storeName: filteredStoreList[index]!.name,
                    imageUrl: filteredStoreList[index]!.image,
                    distance: filteredStoreList[index]!.distance,
                    isSaved: filteredStoreList[index]!.isSaved,
                    ratings: filteredStoreList[index]!.ratings,
                    cropList: filteredStoreList[index]!.cropList,
                  ),
                );
              },
              childCount: filteredStoreList.length,
            ),
          ),
        ],
      ),
    );
  }
}
// Padding(
//               padding: EdgeInsets.all(16),
//               child: Wrap(
//                 spacing: 8,
//                 children: [
//                   FilterChip(
//                     label: Text('All'),
//                     selected: selectedFilter == 'All',
//                     onSelected: (selected) {
//                       updateFilteredStoreList('All');
//                     },
//                   ),
//                   FilterChip(
//                     label: Text('Category'),
//                     selected: selectedFilter == 'Category',
//                     onSelected: (selected) {
//                       updateFilteredStoreList('Category');
//                     },
//                   ),
//                   FilterChip(
//                     label: Text('Rating'),
//                     selected: selectedFilter == 'Rating',
//                     onSelected: (selected) {
//                       updateFilteredStoreList('Rating');
//                     },
//                   ),
//                   FilterChip(
//                     label: Text('Distance'),
//                     selected: selectedFilter == 'Distance',
//                     onSelected: (selected) {
//                       updateFilteredStoreList('Distance');
//                     },
//                   ),
//                 ],
//               ),
//             ),
