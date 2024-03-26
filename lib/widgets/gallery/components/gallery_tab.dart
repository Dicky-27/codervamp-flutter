import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';

class GalleryTabWidget extends StatefulWidget {
  const GalleryTabWidget({super.key});

  @override
  State<GalleryTabWidget> createState() => _GalleryTabWidgetState();
}

class _GalleryTabWidgetState extends State<GalleryTabWidget> {
  final images = [Assets.IMG_T1, Assets.IMG_T2, Assets.IMG_T3];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabPanel(image: images[selectedIndex]),
        const SizedBox(height: 20),
        TabList(
          images: images,
          selectedIndex: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ],
    );
  }
}

class TabList extends StatefulWidget {
  final List<String> images;
  final Function(int index) selectedIndex;

  const TabList({
    Key? key,
    required this.images,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(
            widget.images.length,
            (index) => Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: index == selectedIndex
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.selectedIndex(index);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class TabPanel extends StatelessWidget {
  final String image;

  const TabPanel({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 2.4,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
