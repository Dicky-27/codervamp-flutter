import 'dart:ui';
import 'package:flutter/material.dart';

class SnackbarWidget extends SnackBar {
  final BuildContext context;
  final bool isTop;

  SnackbarWidget(this.context, this.isTop, {super.key})
      : super(
          elevation: 0,
          content: const FrostedGlassBoxWidget(
              width: double.maxFinite,
              height: 50,
              borderRadius: 11,
              child: Text(
                "📢 Yay! A SnackBar!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              )),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          dismissDirection: isTop ? DismissDirection.up : DismissDirection.down,
          margin: EdgeInsets.only(
              bottom: isTop ? MediaQuery.of(context).size.height - 160 : 10,
              left: 10,
              right: 10), // Removed margin from here
        );
}

class FrostedGlassBoxWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;

  const FrostedGlassBoxWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.child,
      this.borderRadius = 30});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: Colors.transparent,
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
            Center(child: child)
          ],
        ),
      ),
    );
  }
}
