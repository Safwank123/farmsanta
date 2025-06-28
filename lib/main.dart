import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Core/store.dart';
import 'package:farmsanta_new/Routes/page_route.dart';
import 'package:farmsanta_new/app_initilization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Services/shared_helper.dart';

ThemeData lightTheme() {
  return ThemeData.light();
}

ThemeData darkTheme() {
  return ThemeData.dark();
}

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitilizer.init();
  await SharedHelper.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBLd6Ha2VmBSiRqcDvDVllyhRvcGB3X9gU",
      appId: "1:100668233247:android:c936890ed64d28fbe7a72a",
      messagingSenderId: "", // ⚠️ Consider setting this if using FCM
      projectId: "fsfarmer-59779",
    ),
  );

  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ZoomDrawerController z = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: routes,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: SharedHelper.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        return const Locale('en');
      },
    );
  }
}
