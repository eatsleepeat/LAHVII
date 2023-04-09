import 'package:EcoPost/leaderboard_page.dart';
import 'challenge_page.dart';
import 'explore_page.dart';
import 'new_post_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ecopost_info.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  static List<TabItem> tabs = new List<TabItem>();

  @override
  Widget build(BuildContext context) {
    tabs = new List<TabItem>();
    tabs.add(TabItem(title: "Post", icon: Icons.add_a_photo));
    tabs.add(TabItem(title: "Explore", icon: Icons.explore));
    tabs.add(TabItem(title: "Tags", icon: FontAwesomeIcons.tags));

    tabs.add(TabItem(title: "Leaderboard", icon: Icons.map));
//    TabController tc = new TabController(length: 3, vsync: TickerProvider);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EcoPostInfo()),
      ],
      child: Container(
        child: DefaultTabController(
          initialIndex: 1,
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Constants.themeGreen,
                title: AutoSizeText('Challenge',
                    minFontSize: 27,
                    style: GoogleFonts.poiretOne(
                        textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 7,
                    ))),
                leading: IconButton(
                  onPressed: () async {
                    //GO to profile page
//                    await Requests.getAllPosts();

                    Navigator.of(context).pushNamed('/ProfilePage');
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.userCircle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.pencilAlt),
                            color: Colors.white,
                            onPressed: () async {
                              Navigator.of(context).pushNamed('/PointsPage');
                            }),
                        AutoSizeText("Redeem Pts")
                      ],
                    ),
                  )
                ],
              ),
              bottomNavigationBar: ConvexAppBar(
//                curveSize: 0,
//                controller: tc,
                initialActiveIndex: 0,
                //Provider.of<EcoPostInfo>(context).activeIndex,
                onTap: (ind) async {
//                await Requests.getFires();
                  var info = Provider.of<EcoPostInfo>(context);
                  info.activeIndex = ind;
                  switch (ind) {
                    case 0:
                      Navigator.of(context).canPop()
                          ? Navigator.of(context).popAndPushNamed('/')
                          : print('cant push');
                      break;
                    case 1:
                      Navigator.of(context).pushNamed('/ExplorePage');
                      break;
                    case 2:
                      //Navigator.of(context).canPop()
//                      Navigator.of(context).pushNamed('/AroundMe');
                      break;
                  }
                },

                items: tabs,
                backgroundColor: Constants.themeGreen,
                style: TabStyle.reactCircle,
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
//                dragStartBehavior: DragStartBehavior.start,
                children: [
                  NewPostPage(),
                  ExplorePage(),
                  ChallengePage(),
                  LeaderboardPage(),
                ].map((i) => Center(child: i)).toList(growable: false),
              )),
        ),
      ),
    );
  }
}
