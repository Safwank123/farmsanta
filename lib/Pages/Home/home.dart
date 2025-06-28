
import 'package:farmsanta_new/Constants/padding.dart';
import 'package:farmsanta_new/Pages/Home/farm_marketplace.dart';
import 'package:farmsanta_new/Pages/Home/menu_screen.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button_with_image.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Routes/image_routes.dart';
import 'drawer_screen.dart';
import 'farm_support_place.dart';

class HomeScreen extends BaseScreen {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  BaseScreenState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _homeTabController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _homeTabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _searchController = TextEditingController();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        backgroundColor: AppThemeColors.getColor(AppThemeColorsEnum.background),
        appBar: AppBarDesigns.getTitleAndDrawerAppbarWithNotification(
          context,
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  MenuScreen(),
              ));
              // if (ZoomDrawer.of(context)!.isOpen()) {
              //   ZoomDrawer.of(context)!.close();
              // } else {
              //   ZoomDrawer.of(context)!.open();
              // }
            },
          ),
          textEditingController: _searchController,
        ),
        body: Column(
          children: [
            widgetSpacing.heightBox,
            // tabBar
            marketplaceSelectionButton(),
            widgetSpacing.heightBox,
            // tabBody
            Expanded(
              child: TabBarView(
                controller: _homeTabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [FarmSupportPlace(), FarmMarketplace()],
              ),
            ),
          ],
        ).wFull(context).hFull(context),
      ),
    );
  }

  Widget marketplaceSelectionButton() {
    return Row(
      children: [
        Expanded(
          child: CustomButtonWithImage(
              text: AppStrings.farmSupportPlace,
              borderRadius: 5,
              buttonColor: _homeTabController.index == 1
                  ? AppThemeColors.getColor(AppThemeColorsEnum.greenDisabled)
                  : AppThemeColors.getColor(AppThemeColorsEnum.primary),
              imagePath: ImageRoutes.circularLogo,
              onTap: () {
                _homeTabController.animateTo(0);
                setState(() {});
              }),
        ),
        12.widthBox,
        Expanded(
          child: CustomButtonWithImage(
              text: AppStrings.farmSantaMarketplace,
              borderRadius: 5,
              buttonColor: _homeTabController.index == 1
                  ? AppThemeColors.getColor(AppThemeColorsEnum.orange)
                  : AppThemeColors.getColor(AppThemeColorsEnum.orangeDisbled),
              imagePath: ImageRoutes.circularLogo,
              onTap: () {
                _homeTabController.animateTo(1);
                setState(() {});
              }),
        ),
      ],
    )
        .pSymmetric(h: hDefaultPadding, v: vDefaultPadding)
        .box
        .make()
        .h(51)
        .color(getColor(AppThemeColorsEnum.white))
        .wFull(context);
  }
}
