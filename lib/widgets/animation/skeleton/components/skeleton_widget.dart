import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BoxSkeleton extends StatelessWidget {
  final double height;
  final double width;
  final double? borderRadius;
  const BoxSkeleton(
      {super.key, required this.height, required this.width, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color(0xFFEAE9ED),
        highlightColor: const Color(0xFFF9F8FA),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: const Color(0xFFFEFEFF),
              borderRadius: BorderRadius.circular(borderRadius ?? 20)),
        ));
  }
}
