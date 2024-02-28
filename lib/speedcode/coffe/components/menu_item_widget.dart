import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
