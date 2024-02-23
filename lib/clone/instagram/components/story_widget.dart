import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatelessWidget {
  final String name;
  final String image;

  const StoryWidget({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xFF833AB4),
                Color(0xFFC837AB),
                Color(0xFFFF543E),
                Color(0xFFFFDD55),
              ], begin: Alignment.topCenter, end: Alignment.bottomLeft)),
          child: Container(
            width: 62,
            height: 62,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: GoogleFonts.roboto(fontSize: 12, color: Colors.black),
        )
      ],
    );
  }
}
