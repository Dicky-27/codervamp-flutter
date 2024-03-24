import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletCardWidget extends StatefulWidget {
  final ExpandableController expandableController;
  const WalletCardWidget({
    super.key,
    required this.expandableController,
  });

  @override
  State<WalletCardWidget> createState() => _WalletCardWidgetState();
}

class _WalletCardWidgetState extends State<WalletCardWidget> {
  ValueNotifier<bool> isHide = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return cardExpandable();
  }

  Widget cardExpandable() {
    return ExpandableNotifier(
      controller: widget.expandableController,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey[850]!, Colors.grey[900]!], // Dark gradient
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Total Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            ValueListenableBuilder<bool>(
                                valueListenable: isHide,
                                builder: ((context, bool value, child) {
                                  return IconButton(
                                      onPressed: () {
                                        isHide.value = !isHide.value;
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: Icon(
                                        value
                                            ? CupertinoIcons.eye_fill
                                            : CupertinoIcons.eye_slash_fill,
                                        color: Colors.white,
                                        size: 14,
                                      ));
                                })),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: ValueListenableBuilder<bool>(
                              valueListenable: isHide,
                              builder: ((context, bool value, child) {
                                return value
                                    ? const Text(
                                        "*****",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : const FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "\$500000",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24),
                                        ),
                                      );
                              })),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Credit",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Expandable(
                    collapsed: Container(),
                    expanded: Column(
                      children: [
                        const SizedBox(height: 16),
                        Divider(
                            color: Colors.white.withOpacity(0.5), height: 1),
                        const SizedBox(height: 16),
                        infoRow("Available Balance", "\$450000"),
                        const SizedBox(height: 16),
                        Divider(
                            color: Colors.white.withOpacity(0.5), height: 1),
                        const SizedBox(height: 16),
                        infoRow("Locked Balance", "\$50000"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }
}
