import 'package:codervamp/widgets/glassmorphism/components/frostedglassbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
