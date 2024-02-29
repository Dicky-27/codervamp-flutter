import 'package:codervamp/widgets/glassmorphism/components/frostedglassbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
