import 'package:codervamp/utils/assets.dart';
import 'package:codervamp/widgets/animation/text/components/animated_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({super.key});

  @override
  State<AnimatedTextPage> createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage> {
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
            const AnimatedTextWidget(),
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
