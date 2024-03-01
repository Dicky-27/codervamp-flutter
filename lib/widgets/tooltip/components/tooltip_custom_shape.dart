import 'package:flutter/material.dart';

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;
  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 5)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 10)
      ..relativeLineTo(10, -10)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class BulletIcon extends StatefulWidget {
  const BulletIcon({super.key});

  @override
  State<BulletIcon> createState() => _BulletIconState();
}

class _BulletIconState extends State<BulletIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _outerScaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _outerScaleAnimation =
        Tween<double>(begin: 0.5, end: 1.3).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.scale(
                  scale: _outerScaleAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.3),
                      border: Border.all(color: Colors.white, width: 2)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
