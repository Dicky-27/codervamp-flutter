import 'package:codervamp/utils/assets.dart';
import 'package:codervamp/utils/dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramClone extends StatefulWidget {
  const InstagramClone({super.key});

  @override
  State<InstagramClone> createState() => _InstagramCloneState();
}

class _InstagramCloneState extends State<InstagramClone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IgAppbarWidget(trailingWidgets: [
        SvgPicture.asset(Assets.IC_HT),
        SvgPicture.asset(Assets.IC_DM)
      ]),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: List.generate(
                    Dummy.stories.length,
                    (index) => StoryWidget(
                        name: Dummy.stories[index]['name'].toString(),
                        image: Dummy.stories[index]['image'].toString())),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                  Dummy.posts.length,
                  (index) => PostWidget(
                      name: Dummy.posts[index]['name'].toString(),
                      profileImage:
                          Dummy.posts[index]['profileImage'].toString(),
                      image: Dummy.posts[index]['image'].toString(),
                      likes: Dummy.posts[index]['likes'].toString(),
                      caption: Dummy.posts[index]['caption'].toString())),
            ),
            const SizedBox(height: 20)
          ],
        )),
      ),
    );
  }
}

/// APP BAR
class IgAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> trailingWidgets;

  const IgAppbarWidget({super.key, required this.trailingWidgets});

  @override
  Widget build(BuildContext context) {
    Widget actions;
    actions = Wrap(spacing: 16, children: trailingWidgets);
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [SvgPicture.asset(Assets.IC_IG), actions],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

/// POST WIDGET
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
  final double size;

  const ProfileWidget({super.key, required this.profileImage, this.size = 30});

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
        height: size,
        width: size,
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

/// STORY WIDGET
class StoryWidget extends StatelessWidget {
  final String name;
  final String image;

  const StoryWidget({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileWidget(profileImage: image, size: 62),
        const SizedBox(height: 5),
        Text(
          name,
          style: GoogleFonts.roboto(fontSize: 12, color: Colors.black),
        )
      ],
    );
  }
}
