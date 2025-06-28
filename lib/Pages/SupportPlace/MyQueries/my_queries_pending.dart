import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import './Widgets/my_queries_card.dart';
import '../../../../../Constants/strings.dart';

class PendingScreen extends BaseScreen {
  static const String routeName = "/myQueries-pending-screen";
  final TextEditingController searchController;
  const PendingScreen(this.searchController, {super.key});

  @override
  BaseScreenState<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends BaseScreenState<PendingScreen> {
  List<FarmScouting> filteredList = [];

  @override
  void initState() {
    filteredList.addAll(StoreHelper.store.pendingFarmScoutingList);

    super.initState();

    widget.searchController.addListener(() {
      String searchText = widget.searchController.text;
      filteredList.clear();
      filteredList.addAll(StoreHelper.store.pendingFarmScoutingList
          .where((element) => element.crop == searchText));
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    // Grid view
    return GridView.builder(
        itemCount: filteredList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return myQueriesCard(
              farmScoutingModel: filteredList[index],
              buttonText: AppStrings.viewQuery,
              isSolved: false);
        }).p12();
  }
}
