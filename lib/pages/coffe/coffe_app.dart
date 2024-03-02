import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeApp extends StatefulWidget {
  const CoffeApp({super.key});

  @override
  State<CoffeApp> createState() => _CoffeAppState();
}

class _CoffeAppState extends State<CoffeApp> {
  List<String> categories = ["Cappucino", "Machiato", "Latte", "Americano"];
  String selectedCategory = "Cappucino";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF313131), Color(0xFF131313)])),
                    child: const Column(
                      children: [
                        SizedBox(height: 60),
                        LocationWidget(),
                        SizedBox(height: 24),
                        SearchWidget()
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    top: MediaQuery.of(context).size.height / 4,
                    child: Image.asset(Assets.IMG_BANNER),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8.5),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      categories.length,
                      (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = categories[index];
                            });
                          },
                          child: CategoryWidget(
                              title: categories[index],
                              isSelected:
                                  categories[index] == selectedCategory))),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 26),
                shrinkWrap: true,
                children: List.generate(
                    6,
                    (index) => const MenuItemWidget(
                        image: Assets.IMG_COFFE_1,
                        rating: 4.7,
                        title: "Cappucino",
                        subTitle: "with Chocolate",
                        price: "\$ 4.53")),
              )
            ],
          ),
        ));
  }
}

/// CATEGORY WIDGET
class CategoryWidget extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryWidget(
      {super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC67C4E) : Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        title,
        style: GoogleFonts.sora(
            fontSize: 14,
            color: isSelected ? Colors.white : const Color(0xFF2F4B4E),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400),
      ),
    );
  }
}

/// LOCATION WIDGET
class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: GoogleFonts.sora(
                  fontSize: 12, color: const Color(0xFFB7B7B7)),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Jakarta, Indonesia",
                  style: GoogleFonts.sora(
                      fontSize: 14,
                      color: const Color(0xFFDDDDDD),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                const Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.white,
                  size: 14,
                )
              ],
            )
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            Assets.IMG_PROFILE_1,
            fit: BoxFit.cover,
            width: 44,
            height: 44,
          ),
        )
      ],
    );
  }
}

/// MENU ITEM WIDGET
class MenuItemWidget extends StatelessWidget {
  final String image;
  final double rating;
  final String title;
  final String subTitle;
  final String price;

  const MenuItemWidget(
      {super.key,
      required this.image,
      required this.rating,
      required this.title,
      required this.subTitle,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 132,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xFFFBBE21),
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rating.toString(),
                      style: GoogleFonts.sora(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2F2D2C))),
                const SizedBox(height: 4),
                Text(subTitle,
                    style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9B9B9B))),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: GoogleFonts.sora(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF2F4B4E))),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFC67C4E)),
                      child: const Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// SEARCH WIDGET
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xFF313131),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(
                CupertinoIcons.search,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  style: GoogleFonts.sora(fontSize: 14, color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Coffee",
                      hintStyle: GoogleFonts.sora(
                          fontSize: 14, color: const Color(0xFF989898))),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(Assets.IC_FURNITUR),
          )
        ],
      ),
    );
  }
}
