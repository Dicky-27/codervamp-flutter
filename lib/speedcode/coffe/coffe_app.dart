import 'package:codervamp/speedcode/coffe/components/category_widget.dart';
import 'package:codervamp/speedcode/coffe/components/location_widget.dart';
import 'package:codervamp/speedcode/coffe/components/menu_item_widget.dart';
import 'package:codervamp/speedcode/coffe/components/search_widget.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';

class CoffeApp extends StatefulWidget {
  const CoffeApp({super.key});

  @override
  State<CoffeApp> createState() => _CoffeAppState();
}

class _CoffeAppState extends State<CoffeApp> {
  List<String> categories = ["Cappucino", "Machiato", "Latte", "Americano"];
  String selectedCaregory = "Cappucino";

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
                              selectedCaregory = categories[index];
                            });
                          },
                          child: CategoryWidget(
                              title: categories[index],
                              isSelected:
                                  categories[index] == selectedCaregory))),
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
