import 'package:codervamp/widgets/animation/animation.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Discover Rarity",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText('Exclusive NFTs'),
                  WavyAnimatedText('Unique Art'),
                  WavyAnimatedText('Innovative Assets'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar.",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Lottie.asset(Assets.LOTTIE_MONKEY,
                width: double.maxFinite, fit: BoxFit.contain),
            const Spacer(),
            SwipeableButtonView(
                buttonText: 'Swipe to Get Started',
                buttonWidget: const Icon(
                  CupertinoIcons.chevron_right_2,
                  color: Colors.white,
                ),
                activeColor: const Color(0xFF1C1C1C),
                buttonColor: const Color(0xFF3416FF),
                onWaitingProcess: () {},
                onFinish: () {}),
          ],
        ),
      ),
    );
  }
}