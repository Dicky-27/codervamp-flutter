import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
