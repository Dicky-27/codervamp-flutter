import 'package:codervamp/widgets/glassmorphism/components/frostedglassbox.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GlassmorphismWidget extends StatefulWidget {
  const GlassmorphismWidget({super.key});

  @override
  State<GlassmorphismWidget> createState() => _GlassmorphismWidgetState();
}

class _GlassmorphismWidgetState extends State<GlassmorphismWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.IMG_BG), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          const Spacer(),
          FrostedGlassBoxWidget(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.width / 1.2,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ice Cream",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Dart",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade300),
                              ),
                            ],
                          )),
                      Column(
                        children: [
                          Lottie.asset(Assets.LOTTIE_MUSIC),
                          const SizedBox(height: 20),
                          SliderTheme(
                              data: SliderThemeData(
                                  trackHeight: 2,
                                  inactiveTrackColor: Colors.white,
                                  activeTrackColor: Colors.red,
                                  thumbColor: Colors.red,
                                  overlayShape: SliderComponentShape.noThumb),
                              child: Slider(
                                value: 5,
                                max: 10,
                                onChanged: (v) {},
                              )),
                          const SizedBox(height: 2),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "02:00",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "04:00",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 18, 50, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.backward_end_fill,
                              color: Colors.grey.shade300,
                              size: 20,
                            ),
                            Icon(
                              CupertinoIcons.gobackward_10,
                              color: Colors.grey.shade300,
                              size: 25,
                            ),
                            const Icon(
                              CupertinoIcons.pause_circle_fill,
                              color: Colors.white,
                              size: 50,
                            ),
                            Icon(
                              CupertinoIcons.goforward_10,
                              color: Colors.grey.shade300,
                              size: 25,
                            ),
                            Icon(
                              CupertinoIcons.forward_end_fill,
                              color: Colors.grey.shade300,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 18, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.speaker_2,
                              color: Colors.grey.shade300,
                              size: 20,
                            ),
                            Icon(
                              CupertinoIcons.heart,
                              color: Colors.grey.shade300,
                              size: 25,
                            ),
                          ],
                        ),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
