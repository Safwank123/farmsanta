import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../base_screen.dart';
import './DetailScreens/add_query_details.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';

class MyQueriesScreen extends BaseScreen {
  static const String routeName = "/myQueries-screen";
  final int currentPageIndex;
  const MyQueriesScreen({super.key, this.currentPageIndex = 0});

  @override
  BaseScreenState<MyQueriesScreen> createState() => _MyQueriesScreen();
}

class _MyQueriesScreen extends BaseScreenState<MyQueriesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final TextEditingController searchController = TextEditingController();
  final List<String> tabNames = [AppStrings.solved, AppStrings.pending];

  // Expanded static data for solved queries
  final List<Map<String, String>> solvedQueries = [
    {
      'title': 'Fertilizer Usage Issue',
      'date': '2024-08-01',
      'reply': 'Apply once in 15 days with 2ml/L ratio.'
    },
    {
      'title': 'Watering Schedule',
      'date': '2024-07-28',
      'reply': 'Use drip irrigation early morning.'
    },
    {
      'title': 'Crop Rotation Plan',
      'date': '2024-07-15',
      'reply': 'Rotate legumes with cereals annually for soil health.'
    },
    {
      'title': 'Weed Control Methods',
      'date': '2024-07-10',
      'reply': 'Use organic mulch and manual weeding.'
    },
    {
      'title': 'Optimal Planting Season',
      'date': '2024-06-25',
      'reply': 'Plant in early spring for best yield.'
    },
  ];

  // Expanded static data for pending queries
  final List<Map<String, String>> pendingQueries = [
    {
      'title': 'Soil Quality Concerns',
      'date': '2024-08-06',
    },
    {
      'title': 'Pest Control Suggestion',
      'date': '2024-08-04',
    },
    {
      'title': 'Irrigation System Failure',
      'date': '2024-08-02',
    },
    {
      'title': 'Seed Germination Issues',
      'date': '2024-07-30',
    },
    {
      'title': 'Nutrient Deficiency in Crops',
      'date': '2024-07-25',
    },
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: tabNames.length,
      initialIndex: widget.currentPageIndex,
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleAndIconButton(
        AppStrings.myQueries,
        IconButton(
          onPressed: () {
            navigateToPageWithoutReplaceMent(const AddQueryDetails());
          },
          icon: Icon(
            Icons.add_box_outlined,
            color: AppColors.invert,
            size: 28,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          WidgetHelper.searchBarOnly(
            AppStrings.searchYourQueries,
            searchController,
          ).pSymmetric(h: 15, v: 10),

          15.heightBox,

          // TabBar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              tabs: tabNames
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(e),
                      ))
                  .toList(),
            ),
          ),

          15.heightBox,

          // TabBar View
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _buildSolvedQueries(),
                _buildPendingQueries(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSolvedQueries() {
    if (solvedQueries.isEmpty) {
      return Center(child: Text("No solved queries available.", style: TextStyle(color: Colors.grey[600])));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: solvedQueries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final item = solvedQueries[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.withOpacity(0.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.green, size: 24).pOnly(right: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    8.heightBox,
                    Text(
                      "Date: ${item['date']}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    8.heightBox,
                    Text(
                      "Reply: ${item['reply']}",
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPendingQueries() {
    if (pendingQueries.isEmpty) {
      return Center(child: Text("No pending queries available.", style: TextStyle(color: Colors.grey[600])));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: pendingQueries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final item = pendingQueries[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.hourglass_empty, color: Colors.orange, size: 24).pOnly(right: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    8.heightBox,
                    Text(
                      "Submitted on: ${item['date']}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    8.heightBox,
                    Text(
                      "Status: Awaiting reply",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}