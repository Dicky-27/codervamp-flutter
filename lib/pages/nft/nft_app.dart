import 'dart:ui';
import 'package:codervamp/utils/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NftApp extends StatelessWidget {
  const NftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF00041C),
        appBar: const NftBarWidget(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 40),
          child: Column(children: [
            const NftSearchWidget(),
            const SizedBox(height: 25),
            const SectionTitleWidget(title: "Hot Collections"),
            const SizedBox(height: 15),
            Column(
              children: List.generate(
                  Dummy.nftsCollections.length,
                  (index) => CollectionWidget(
                        image: Dummy.nftsCollections[index]["image"],
                        title: Dummy.nftsCollections[index]["title"],
                        subtitle: Dummy.nftsCollections[index]["subtitle"],
                        price: Dummy.nftsCollections[index]["price"],
                        percent: Dummy.nftsCollections[index]["percent"],
                        nfts: Dummy.nftsCollections[index]["nfts"],
                        isIncrease: Dummy.nftsCollections[index]["isIncrease"],
                      )),
            ),
            const SizedBox(height: 25),
            const SectionTitleWidget(title: "Hot NFTs"),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(
                    Dummy.nfts.length,
                    (index) => NftWidget(
                        title: Dummy.nfts[index]["title"],
                        image: Dummy.nfts[index]["image"],
                        category: Dummy.nfts[index]["category"],
                        price: Dummy.nfts[index]["price"])),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(Dummy.nfts.length, (index) {
                  var reversedList = Dummy.nfts.reversed.toList();
                  return NftWidget(
                      title: reversedList[index]["title"],
                      image: reversedList[index]["image"],
                      category: reversedList[index]["category"],
                      price: reversedList[index]["price"]);
                }),
              ),
            ),
          ]),
        ));
  }
}

/// APP BAR
class NftBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const NftBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "NFT\nAPP",
            style: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$ 50.21",
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const SizedBox(height: 2),
                Text("NFTs 26",
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white))
              ],
            ),
          )
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

/// COLLECTION WIDGET
class CollectionWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String percent;
  final int nfts;
  final bool isIncrease;

  const CollectionWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.percent,
      required this.nfts,
      this.isIncrease = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Image.asset(
                    image,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  FrostedGlassBoxWidget(
                      width: 15,
                      height: 15,
                      child: Text(
                        nfts.toString(),
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(subtitle,
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w700))
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isIncrease
                                ? const Color(0xFF6BCD61)
                                : const Color(0xFFCC5C89)),
                      ),
                      const SizedBox(width: 5),
                      Text(price,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(percent,
                      style: GoogleFonts.inter(
                          color: isIncrease
                              ? const Color(0xFF6BCD61)
                              : const Color(0xFFCC5C89),
                          fontSize: 14,
                          fontWeight: FontWeight.w700))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

/// SEARCH WIDGET
class NftSearchWidget extends StatelessWidget {
  const NftSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.11), width: 2),
          borderRadius: BorderRadius.circular(9)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextField(
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xFF474A5B))),
                ),
              )
            ],
          ),
          const Spacer(),
          const Icon(
            CupertinoIcons.search,
            size: 20,
            color: Color(0xFF474A5B),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

/// GLASS BOX WIDGET
class FrostedGlassBoxWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;

  const FrostedGlassBoxWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.child,
      this.borderRadius = 30});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: Colors.transparent,
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
            Center(child: child)
          ],
        ),
      ),
    );
  }
}

/// NFT WIDGET
class NftWidget extends StatelessWidget {
  final String title;
  final String image;
  final String category;
  final String price;

  const NftWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.category,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 140,
                  height: 140,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: FrostedGlassBoxWidget(
                      borderRadius: 4,
                      width: 50,
                      height: 25,
                      child: Text(
                        category,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )))
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              price,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

/// SECTION TITLE WIDGET
class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Icon(
              CupertinoIcons.chevron_right_circle_fill,
              color: Colors.white,
            )
          ],
        ));
  }
}
