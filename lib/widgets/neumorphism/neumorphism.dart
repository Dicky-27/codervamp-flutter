import 'package:codervamp/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/neu_decoration.dart';

class Neumorphism extends StatefulWidget {
  const Neumorphism({super.key});

  @override
  State<Neumorphism> createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism>
    with TickerProviderStateMixin {
  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: NeuDecoration(),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text("PLAYLIST",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: NeuDecoration(),
                      child: Icon(
                        CupertinoIcons.line_horizontal_3,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                    )
                  ],
                ))),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(rotationController),
                  child: Container(
                      decoration: PlayNeuDecoration(),
                      child: const CircleAvatar(
                        radius: 180,
                        backgroundImage: AssetImage(Assets.IMG_SONG),
                      )),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Warfaze",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "02:00",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "04:00",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                const SizedBox(height: 2),
                SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 5,
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.blue,
                        thumbColor: Colors.blue,
                        overlayShape: SliderComponentShape.noThumb),
                    child: Slider(
                      value: 5,
                      max: 10,
                      onChanged: (v) {},
                    )),
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: NeuDecoration(),
                          child: Icon(
                            CupertinoIcons.backward_fill,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: NeuDecoration(),
                          child: Icon(
                            CupertinoIcons.pause_fill,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: NeuDecoration(),
                          child: Icon(
                            CupertinoIcons.forward_fill,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
