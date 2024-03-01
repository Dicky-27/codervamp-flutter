import 'package:codervamp/widgets/bento/components/bento_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bento extends StatefulWidget {
  const Bento({super.key});

  @override
  State<Bento> createState() => _BentoState();
}

class _BentoState extends State<Bento> {
  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchTerm = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: const Icon(CupertinoIcons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                )),
            BentoWidget(searchTerm: searchTerm)
          ],
        ),
      ),
    );
  }
}
