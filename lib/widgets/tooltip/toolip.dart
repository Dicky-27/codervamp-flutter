import 'package:codervamp/widgets/tooltip/components/tooltip_custom_shape.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({super.key});

  @override
  State<TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          Assets.IMG_DESK,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: 360,
          right: 90,
          child: Tooltip(
            textAlign: TextAlign.center,
            richMessage: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              children: const [
                TextSpan(
                  text: 'Monitor\n',
                ),
                TextSpan(
                  text: '\$20.99',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            showDuration: const Duration(seconds: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: ToolTipCustomShape(),
            ),
            preferBelow: false,
            verticalOffset: 20,
            triggerMode: TooltipTriggerMode.tap,
            child: const BulletIcon(),
          ),
        ),
        Positioned(
          top: 470,
          right: 30,
          child: Tooltip(
            textAlign: TextAlign.center,
            richMessage: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              children: const [
                TextSpan(
                  text: 'Mac\n',
                ),
                TextSpan(
                  text: '\$25.99',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            showDuration: const Duration(seconds: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: ToolTipCustomShape(),
            ),
            preferBelow: false,
            verticalOffset: 20,
            triggerMode: TooltipTriggerMode.tap,
            child: const BulletIcon(),
          ),
        ),
        Positioned(
          top: 430,
          left: 50,
          child: Tooltip(
            textAlign: TextAlign.center,
            richMessage: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              children: const [
                TextSpan(
                  text: 'iPad\n',
                ),
                TextSpan(
                  text: '\$10.99',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            showDuration: const Duration(seconds: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: ToolTipCustomShape(),
            ),
            preferBelow: false,
            verticalOffset: 20,
            triggerMode: TooltipTriggerMode.tap,
            child: const BulletIcon(),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Desk Setup",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    ));
  }
}
