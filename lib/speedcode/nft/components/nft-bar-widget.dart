import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
