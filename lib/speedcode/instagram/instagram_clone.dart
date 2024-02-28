import 'package:codervamp/speedcode/instagram/components/ig_appbar_widget.dart';
import 'package:codervamp/speedcode/instagram/components/post_widget.dart';
import 'package:codervamp/speedcode/instagram/components/story_widget.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:codervamp/utils/dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
