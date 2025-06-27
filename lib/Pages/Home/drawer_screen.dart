
import 'package:farmsanta_new/Pages/Home/home.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../Widgets/classes/style_helper.dart';
import 'menu_screen.dart';

class DrawerScreen extends StatelessWidget {
  static const String routeName = "/drawer-screen";
  DrawerScreen({super.key});
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
      borderRadius: 0.0,
      menuScreenWidth: width,
      menuBackgroundColor: AppColors.primary,
      mainScreenTapClose: true,
      mainScreenScale: 0.15,
      style: DrawerStyle.defaultStyle,
      androidCloseOnBackTap: true,
      drawerShadowsBackgroundColor: AppColors.primary,
      angle: 0,
      showShadow: false,
      slideWidth: width * 0.7,
    );
  }
}
