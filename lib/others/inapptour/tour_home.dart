/*
  Hi!!!

  This file is organized into sections for easy navigation.

  Sections:
  - Variables
  - Global Keys
  - Tour Functions
  - Initialization
  - UI

  Search using section mark like "// MARK: - Variables" to find specific content.

  Don't forget to give a star on my GitHub @Dicky-27!
*/

import 'dart:ui';
import 'package:codervamp/utils/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TourHomePage extends StatefulWidget {
  const TourHomePage({super.key});

  @override
  State<TourHomePage> createState() => _TourHomePageState();
}

class _TourHomePageState extends State<TourHomePage> {
  // MARK: - Variables
  late TutorialCoachMark tutorialCoachMark;

  // MARK: - Global Keys
  GlobalKey appbarKeyButtonLeft = GlobalKey();
  GlobalKey appbarKeyButtonRight = GlobalKey();
  GlobalKey menuKeyButton = GlobalKey();
  GlobalKey viewAllKeyButton = GlobalKey();
  GlobalKey destinationKeyButton = GlobalKey();

  // MARK: - Tour Functions
  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.blue,
      textSkip: "SKIP",
      textStyleSkip: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];

    targets.add(
      TargetFocus(
        identify: "Target 0",
        keyTarget: appbarKeyButtonLeft,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Appbar Left Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: appbarKeyButtonRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Appbar Right Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: menuKeyButton,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    "Menu Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        shape: ShapeLightFocus.RRect,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 3",
        keyTarget: viewAllKeyButton,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    "View All Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Target 4",
        keyTarget: destinationKeyButton,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Destination Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        shape: ShapeLightFocus.RRect,
      ),
    );

    return targets;
  }

  // MARK: - Initialization

  @override
  void initState() {
    ///  Add your condition here to show the tutorial only once (using SharedPreferences, for example).
    ///   This ensures a user sees the tutorial when necessary.
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  // MARK: - UI

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 41) / 3;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    key: appbarKeyButtonLeft,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const Icon(CupertinoIcons.square_grid_2x2)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.pin_fill,
                          color: Colors.blue.shade300,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Denpasar, Bali ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                    key: appbarKeyButtonRight,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const Icon(CupertinoIcons.person)),
              ],
            ),
          )),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: List.generate(
                    Dummy.menus.length,
                    (index) => Container(
                          key: index == 1 ? menuKeyButton : null,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: index == 1
                                  ? Colors.blue.shade300
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    Dummy.menus[index]['emoji'].toString(),
                                    style: const TextStyle(fontSize: 20),
                                  )),
                              const SizedBox(width: 8),
                              Text(
                                Dummy.menus[index]['title'].toString(),
                                style: TextStyle(
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )),
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular in town",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      Container(
                          key: viewAllKeyButton,
                          child: Text("View all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.blue.shade500)))
                    ],
                  )),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: List.generate(
                    Dummy.destinations.length,
                    (index) => Container(
                          key: index == 0 ? destinationKeyButton : null,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                width: double.maxFinite,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    Dummy.destinations[index]['imgPath']
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                              const SizedBox(height: 10),
                              Text(
                                Dummy.destinations[index]['title'].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.pin_fill,
                                    color: Colors.grey.shade400,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    Dummy.destinations[index]['location']
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
