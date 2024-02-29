import 'package:codervamp/speedcode/nft/components/collection-widget.dart';
import 'package:codervamp/speedcode/nft/components/nft-bar-widget.dart';
import 'package:codervamp/speedcode/nft/components/nft-search-widget.dart';
import 'package:codervamp/speedcode/nft/components/nft-widget.dart';
import 'package:codervamp/speedcode/nft/components/section-title-widget.dart';
import 'package:codervamp/utils/dummy.dart';
import 'package:flutter/material.dart';

class NftApp extends StatelessWidget {
  const NftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF00041C),
        appBar: const NftBarWidget(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 40),
          child: Column(children: [
            const NftSearchWidget(),
            const SizedBox(height: 25),
            const SectionTitleWidget(title: "Hot Collections"),
            const SizedBox(height: 15),
            Column(
              children: List.generate(
                  Dummy.nftsCollections.length,
                  (index) => CollectionWidget(
                        image: Dummy.nftsCollections[index]["image"],
                        title: Dummy.nftsCollections[index]["title"],
                        subtitle: Dummy.nftsCollections[index]["subtitle"],
                        price: Dummy.nftsCollections[index]["price"],
                        percent: Dummy.nftsCollections[index]["percent"],
                        nfts: Dummy.nftsCollections[index]["nfts"],
                        isIncrease: Dummy.nftsCollections[index]["isIncrease"],
                      )),
            ),
            const SizedBox(height: 25),
            const SectionTitleWidget(title: "Hot NFTs"),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(
                    Dummy.nfts.length,
                    (index) => NftWidget(
                        title: Dummy.nfts[index]["title"],
                        image: Dummy.nfts[index]["image"],
                        category: Dummy.nfts[index]["category"],
                        price: Dummy.nfts[index]["price"])),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(Dummy.nfts.length, (index) {
                  var reversedList = Dummy.nfts.reversed.toList();
                  return NftWidget(
                      title: reversedList[index]["title"],
                      image: reversedList[index]["image"],
                      category: reversedList[index]["category"],
                      price: reversedList[index]["price"]);
                }),
              ),
            ),
          ]),
        ));
  }
}
