import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
