import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BentoWidget extends StatelessWidget {
  final String searchTerm;
  const BentoWidget({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    final List<Menu> menus = [
      Menu(
          icon: CupertinoIcons.folder_circle_fill,
          title: "Design System",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "25"),
      Menu(
          icon: CupertinoIcons.news_solid,
          title: "News",
          backgroundColor: 0xFF7A76E1,
          foregroundColor: 0xFFFFFFFF,
          value: "150"),
      Menu(
          icon: CupertinoIcons.book_fill,
          title: "Design Books",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "100"),
      Menu(
          icon: CupertinoIcons.mic_fill,
          title: "Podcast",
          backgroundColor: 0xFFFFDD4A,
          foregroundColor: 0xFF000000,
          value: "33"),
      Menu(
          icon: CupertinoIcons.tortoise_fill,
          title: "Gradient Tools",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "27"),
      Menu(
          icon: CupertinoIcons.doc_fill,
          title: "Color Tools",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "89"),
      Menu(
          icon: CupertinoIcons.pencil_slash,
          title: "Drawing Tools",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "3"),
      Menu(
          icon: CupertinoIcons.tag_solid,
          title: "Others",
          backgroundColor: 0xFFFFFFFF,
          foregroundColor: 0xFF000000,
          value: "5"),
    ];

    final List<int> mainAxisCell3Index = [0, 5, 6, 7];
    final List<int> mainAxisCell4Index = [2, 4];

    List<Menu> getFilteredMenus() {
      return searchTerm.isEmpty
          ? menus
          : menus
              .where((menu) =>
                  menu.title.toLowerCase().contains(searchTerm.toLowerCase()))
              .toList();
    }

    return Padding(
        padding: const EdgeInsets.all(20),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: getFilteredMenus().map((Menu menu) {
            final index = menus.indexOf(menu);
            final int mainAxisCellCount = mainAxisCell3Index.contains(index)
                ? 2
                : (mainAxisCell4Index.contains(index) ? 3 : 1);

            return StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: mainAxisCellCount,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Color(menu.backgroundColor)),
                  margin: const EdgeInsets.all(4),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                                visible: mainAxisCell3Index.contains(index) ||
                                    mainAxisCell4Index.contains(index),
                                child: Icon(
                                  menu.icon,
                                  size: 40,
                                  color: Colors.blueAccent.shade200,
                                )),
                            const SizedBox(height: 2),
                            Text(menu.title,
                                style: TextStyle(
                                    color: Color(menu.foregroundColor),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(menu.value,
                                style: TextStyle(
                                    color: Color(menu.foregroundColor),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: mainAxisCell4Index.contains(index),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange.shade200),
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          }).toList(),
        ));
  }
}

class Menu {
  final IconData icon;
  final String title;
  final int backgroundColor;
  final int foregroundColor;
  final String value;

  Menu(
      {required this.icon,
      required this.title,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.value});
}
