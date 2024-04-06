import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AccordionWidget extends StatelessWidget {
  final String title;
  final String desc;

  const AccordionWidget({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.white.withOpacity(0.5)))),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        collapsed: const Text(''),
        expanded: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(desc, style: const TextStyle(color: Colors.white)),
        ),
        theme: const ExpandableThemeData(
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: true,
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
