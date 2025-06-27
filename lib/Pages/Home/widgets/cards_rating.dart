// import 'package:farmsanta/Models/Common/cardmodel.dart';
// import 'package:farmsanta/Pages/Home/widgets/store_card.dart';
// import 'package:farmsanta/Pages/Home/widgets/store_tile.dart';
// import 'package:flutter/material.dart';
//
// class RatedStoreFilter extends StatefulWidget {
//   final List<StoreCardModel> storeList;
//
//   RatedStoreFilter({required this.storeList});
//
//   @override
//   _RatedStoreFilterState createState() => _RatedStoreFilterState();
// }
//
// class _RatedStoreFilterState extends State<RatedStoreFilter> {
//   String selectedFilter = 'Rating';
//   List<StoreCardModel> filteredStoreList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredStoreList = List.from(widget.storeList)
//       ..sort((a, b) => b.ratings.compareTo(a.ratings));
//   }
//
//   void updateFilteredStoreList(String filter) {
//     setState(() {
//       selectedFilter = filter;
//       filteredStoreList = getRatedStoreList(filter);
//     });
//   }
//
//   List<StoreCardModel> getRatedStoreList(String filter) {
//     switch (filter) {
//       case 'All':
//         return widget.storeList;
//       case 'Category':
//         // Implement filter logic here based on category
//         // ...
//         break;
//       case 'Rating':
//         // Return storeList sorted by ratings in descending order
//         return List.from(widget.storeList)
//           ..sort((a, b) => b.ratings.compareTo(a.ratings));
//       case 'Distance':
//         // Return storeList sorted by distance in ascending order
//         return List.from(widget.storeList)
//           ..sort((a, b) => a.distance.compareTo(b.distance));
//       default:
//         // Return storeList as is
//         return List.from(widget.storeList)
//           ..sort((a, b) => b.ratings.compareTo(a.ratings));
//     }
//     return widget.storeList;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Padding(
//           //   padding: EdgeInsets.all(16),
//           //   child: Wrap(
//           //     spacing: 8,
//           //     children: [
//           //       FilterChip(
//           //         label: Text('All'),
//           //         selected: selectedFilter == 'All',
//           //         onSelected: (selected) {
//           //           updateFilteredStoreList('All');
//           //         },
//           //       ),
//           //       FilterChip(
//           //         label: Text('Category'),
//           //         selected: selectedFilter == 'Category',
//           //         onSelected: (selected) {
//           //           updateFilteredStoreList('Category');
//           //         },
//           //       ),
//           //       FilterChip(
//           //         label: Text('Rating'),
//           //         selected: selectedFilter == 'Rating',
//           //         onSelected: (selected) {
//           //           updateFilteredStoreList('Rating');
//           //         },
//           //       ),
//           //       FilterChip(
//           //         label: Text('Distance'),
//           //         selected: selectedFilter == 'Distance',
//           //         onSelected: (selected) {
//           //           updateFilteredStoreList('Distance');
//           //         },
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: filteredStoreList.length,
//               itemBuilder: (context, index) {
//                 return StoreCardWidget(
//                   storeName: filteredStoreList[index].name,
//                   imageUrl: filteredStoreList[index].image,
//                   distance: filteredStoreList[index].distance,
//                   isSaved: filteredStoreList[index].isSaved,
//                   ratings: filteredStoreList[index].ratings,
//                   cropList: filteredStoreList[index].cropList,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
