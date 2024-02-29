import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
