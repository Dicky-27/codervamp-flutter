import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotifyApp extends StatefulWidget {
  const SpotifyApp({super.key});

  @override
  State<SpotifyApp> createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {
  List<String> charts = [
    Assets.IMG_PLAY_1,
    Assets.IMG_PLAY_2,
    Assets.IMG_PLAY_3
  ];
  List<String> made = [Assets.IMG_PLAY_3, Assets.IMG_PLAY_2, Assets.IMG_PLAY_1];
  List<String> popular = [
    Assets.IMG_PLAY_2,
    Assets.IMG_PLAY_1,
    Assets.IMG_PLAY_3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: const SpotifyAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  PLaylistWidget(image: Assets.IMG_BG, title: "Lana Del Rey"),
                  SizedBox(width: 10),
                  PLaylistWidget(
                      image: Assets.IMG_BEDUGUL, title: "1(Remastered)")
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Charts",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: List.generate(
                    charts.length,
                    (index) => ItemWidget(
                        image: charts[index],
                        title:
                            "Ed Sheeran, Big Sean, Juice WRLD, Post Malone")),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Made For You",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: List.generate(
                    made.length,
                    (index) => ItemWidget(
                        image: made[index],
                        title:
                            "Ed Sheeran, Big Sean, Juice WRLD, Post Malone")),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular Radio",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: List.generate(
                    popular.length,
                    (index) => ItemWidget(
                        image: popular[index],
                        title:
                            "Ed Sheeran, Big Sean, Juice WRLD, Post Malone")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Item Widget
class ItemWidget extends StatelessWidget {
  final String image;
  final String title;

  const ItemWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 150,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFB3B3B3)),
            )
          ],
        ));
  }
}

/// PLaylist
class PLaylistWidget extends StatelessWidget {
  final String image;
  final String title;

  const PLaylistWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFF282828)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )))
        ],
      ),
    ));
  }
}

/// APP BAR
class SpotifyAppbar extends StatefulWidget implements PreferredSizeWidget {
  const SpotifyAppbar({super.key});

  @override
  State<SpotifyAppbar> createState() => _SpotifyAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _SpotifyAppbarState extends State<SpotifyAppbar> {
  List<String> categories = ["All", "Music", "Podcast"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: const BoxDecoration(
                color: Color(0xFF3371E4), shape: BoxShape.circle),
            child: Text(
              "C",
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 3),
          Row(
            children: List.generate(
                categories.length,
                (index) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selectedCategory == categories[index]
                                ? const Color(0xFF1DB954)
                                : const Color(0xFF282828)),
                        child: Text(
                          categories[index],
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: selectedCategory == categories[index]
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                    )),
          )
        ],
      ),
    ));
  }
}

/// TABBAR
class SpotifyTabBarPage extends StatefulWidget {
  const SpotifyTabBarPage({super.key});

  @override
  State<SpotifyTabBarPage> createState() => _SpotifyTabBarPage();
}

class _SpotifyTabBarPage extends State<SpotifyTabBarPage> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      bottomNavigationBar: MediaQuery(
          data: const MediaQueryData(padding: EdgeInsets.only(bottom: 15)),
          child: SafeArea(
            minimum: isNeedSafeArea
                ? const EdgeInsets.only(bottom: 30)
                : EdgeInsets.zero,
            child: BottomNavigationBar(
                currentIndex: currentPage,
                backgroundColor: const Color(0xFF111111),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                unselectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4F4F4F)),
                selectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                unselectedItemColor: const Color(0xFF4F4F4F),
                selectedItemColor: Colors.white,
                onTap: ((value) {
                  if (currentPage != value) {
                    setState(() {
                      currentPage = value;
                    });
                    pageController.jumpToPage(value);
                  }
                }),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      activeIcon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(
                          Assets.IC_HOME,
                          color: Colors.white,
                        ),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(
                          Assets.IC_HOME,
                          color: const Color(0xFF4F4F4F),
                        ),
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      activeIcon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(
                          Assets.IC_SEARCH,
                          color: Colors.white,
                        ),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(
                          Assets.IC_SEARCH,
                          color: const Color(0xFF4F4F4F),
                        ),
                      ),
                      label: "Search"),
                  BottomNavigationBarItem(
                      activeIcon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(
                          Assets.IC_LIBRARY,
                          color: Colors.white,
                        ),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: SvgPicture.asset(Assets.IC_LIBRARY,
                            color: const Color(0xFF4F4F4F)),
                      ),
                      label: "Your Library"),
                ]),
          )),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [const SpotifyApp(), Container(), Container()]),
          Container(
              width: double.maxFinite,
              height: 65,
              decoration: BoxDecoration(
                  color: const Color(0xFF550A1C),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          Assets.IMG_BG,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From Me to You",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Mono",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFB3B3B3)),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.bluetooth,
                            color: Color(0xFF1DB954),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            CupertinoIcons.play_arrow_solid,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 2,
                    backgroundColor: const Color(0xFF3A434F),
                    color: const Color(0xFFB2B2B2),
                    borderRadius: BorderRadius.circular(4),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
