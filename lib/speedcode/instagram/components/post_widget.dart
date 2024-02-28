import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String profileImage;
  final String image;
  final String likes;
  final String caption;

  const PostWidget(
      {super.key,
      required this.name,
      required this.profileImage,
      required this.image,
      required this.likes,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Container(
            height: 0.5,
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.1),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.5, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ProfileWidget(profileImage: profileImage),
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                            fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  SvgPicture.asset(Assets.IC_MORE)
                ],
              )),
          SizedBox(
            height: 469,
            width: double.maxFinite,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.IC_HT),
                    const SizedBox(width: 18),
                    SvgPicture.asset(Assets.IC_COMMENT),
                    const SizedBox(width: 18),
                    SvgPicture.asset(Assets.IC_DM),
                  ],
                ),
                SvgPicture.asset(Assets.IC_SAVE)
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$likes likes",
                      style: GoogleFonts.roboto(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '$name ',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black)),
                      TextSpan(
                          text: caption,
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.black))
                    ]))
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String profileImage;

  const ProfileWidget({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [
          Color(0xFF833AB4),
          Color(0xFFC837AB),
          Color(0xFFFF543E),
          Color(0xFFFFDD55),
        ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(2),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(profileImage), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
