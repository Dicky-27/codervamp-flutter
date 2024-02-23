import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IgAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> trailingWidgets;

  const IgAppbarWidget({super.key, required this.trailingWidgets});

  @override
  Widget build(BuildContext context) {
    Widget actions;
    actions = Wrap(spacing: 16, children: trailingWidgets);
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [SvgPicture.asset(Assets.IC_IG), actions],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
