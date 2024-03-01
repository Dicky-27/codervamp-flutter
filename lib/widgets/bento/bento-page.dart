import 'package:codervamp/widgets/bento/components/bento_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BentoPage extends StatefulWidget {
  const BentoPage({super.key});

  @override
  State<BentoPage> createState() => _BentoPageState();
}

class _BentoPageState extends State<BentoPage> {
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
