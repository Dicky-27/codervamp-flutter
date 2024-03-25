import 'package:codervamp/widgets/bar/floating_bottom_nav_bar/components/floating_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class PageModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  PageModel({required this.page, required this.navKey});
}

class FloatingBottomNavbarPage extends StatefulWidget {
  const FloatingBottomNavbarPage({super.key});

  @override
  State<FloatingBottomNavbarPage> createState() =>
      _FloatingBottomNavbarPageState();
}

class _FloatingBottomNavbarPageState extends State<FloatingBottomNavbarPage> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<PageModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      PageModel(
        page: const TabPage(tab: 1),
        navKey: homeNavKey,
      ),
      PageModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
      PageModel(
        page: const TabPage(tab: 3),
        navKey: notificationNavKey,
      ),
      PageModel(
        page: const TabPage(tab: 4),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: selectedTab,
        children: items
            .map((page) => Navigator(
                  key: page.navKey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [MaterialPageRoute(builder: (context) => page.page)];
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: FloatingBottomNavbar(
        pageIndex: selectedTab,
        onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 24))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
