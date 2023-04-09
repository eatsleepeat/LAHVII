import 'comments_page.dart';
import 'home_page.dart';
import 'leaderboard_page.dart';
import 'login_page.dart';
import 'shop_page.dart';
import 'constants.dart';
import 'my_profile_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the MapView Screen
//        '/ReportPage': (context) => ChangeNotifierProvider(
//            create: (context) => FormInfo(), child: ReportPage()),
        '/HomePage': (context) => new MyHome(),
        '/ProfilePage': (context) => new MyProfilePage(),
        '/LeaderBoardPage': (context) => new LeaderboardPage(),
        '/PointsPage': (context) => new ShopPage(),
        '/CommentsPage': (context) => new CommentsPage(),
      },
      theme: ThemeData(
        primaryColor: Constants.themeGreen,
      ),
      home: LoginPage(),
    );
  }
}
