import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
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
    );
  }
}
