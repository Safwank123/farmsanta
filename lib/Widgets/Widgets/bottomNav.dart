
import 'package:farmsanta_new/Pages/Home/home.dart';
import 'package:farmsanta_new/Pages/Profile/profile.dart';
import 'package:farmsanta_new/Pages/Start/splash.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool _showFab = true;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: AnimatedSlide(
                duration: duration,
                offset: _showFab ? Offset.zero : Offset(0, 2),
                child: AnimatedOpacity(
                    duration: duration,
                    opacity: _showFab ? 1 : 0,
                    child: NavigationBar(
                      height: 70,
                      backgroundColor: AppThemeColors.getColor(AppThemeColorsEnum.background),
                      onDestinationSelected: (int index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      selectedIndex: currentPageIndex,
                      elevation: 0,
                      destinations: const [
                        NavigationDestination(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: Icon(MaterialSymbols.home),
                          ),
                          selectedIcon: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(MaterialSymbols.home_filled),
                          ),
                          label: 'Home',
                        ),
                        NavigationDestination(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(MaterialSymbols.grid_view),
                          ),
                          selectedIcon: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(MaterialSymbols.grid_view_filled),
                          ),
                          label: 'Catogeries',
                        ),
                        NavigationDestination(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(MaterialSymbols.location_on),
                          ),
                          selectedIcon: Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: Icon(MaterialSymbols.location_on_filled),
                          ),
                          label: 'Location',
                        ),
                        NavigationDestination(
                          icon: Icon(
                            Icons.account_circle_outlined,
                          ),
                          selectedIcon: Icon(Icons.account_circle_rounded),
                          label: 'My Account',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.local_mall_outlined, weight: 0.1),
                          selectedIcon: Icon(Icons.local_mall),
                          label: 'Cart',
                        )
                      ],
                    ))),
            body: <Widget>[
              NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    //final VerticalDirection verticalDirection = notification.direction;
                    final ScrollDirection direction = notification.direction;
                    setState(() {
                      if (direction == ScrollDirection.reverse) {
                        _showFab = false;
                      } else if (direction == ScrollDirection.forward) {
                        _showFab = true;
                      }
                    });
                    return true;
                  },
                  child: HomeScreen()
                  // Homepage(
                  //     address: "Bhagwan nagar, Nagpur",
                  //     mobileNumber: "9837489237",
                  //     uname: 'Asang Borkar',
                  //     userName: "asangzz"),
                  ),

              SplashScreen(),
              //CheckoutPage(),
              SplashScreen(),
              //MyCartPage(),
              SplashScreen(), ProfileScreen()
            ][currentPageIndex],
          ),
        ),
      ),
    );
  }
}
