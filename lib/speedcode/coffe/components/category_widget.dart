import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
