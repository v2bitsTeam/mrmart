import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mr_mart/Widgets/ListScrollBehavior.dart';
import 'package:mr_mart/app_components/AppTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Language/Language.dart';
import 'Providers/SplashProvider.dart';
import 'Route/Route.dart';

Language language = Language();
SharedPreferences prefs;

double paddingTop, appbarHeight, screenRatio, paddingBottom;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetMaterialApp(
      initialRoute: SPLASH_SCREEN,
      defaultTransition: Transition.leftToRightWithFade,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ListScrollBehavior(),
          child: child,
        );
      },
      getPages: appRoutes(),
    );
  }
}
