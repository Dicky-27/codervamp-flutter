import 'dart:io';
import 'package:flutter/material.dart';

class FloatingBottomNavbar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const FloatingBottomNavbar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 70,
        right: 70,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Container(
            height: 60,
            color: const Color(0xFF1A1A1A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.article_outlined,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                navItem(
                  Icons.search_outlined,
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  Icons.person_outline,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    Color iconColor =
        selected ? Colors.blueAccent : Colors.white.withOpacity(0.6);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(60),
        child: Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}
