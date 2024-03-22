import 'package:flutter/material.dart';

class MultiSelectWidget extends StatefulWidget {
  const MultiSelectWidget({super.key});

  @override
  State<MultiSelectWidget> createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  List<String> interests = [
    "🎨 Art",
    "💱 Crypto",
    "🍰 Baking",
    "🚗 Cars",
    "📱 Technology",
    "👗 Fashion",
    "🏠 Real Estate",
    "🐶 Dogs",
    "💰 Finance",
    "🎮 Gaming",
    "🎵 Music",
    "📚 Reading",
    "🍳 Cooking",
    "🌿 Gardening",
    "🏀 Sports",
    "🎥 Movies",
    "🔭 Astronomy",
    "🎭 Theater",
    "🧘‍♂️ Yoga",
    "🚀 Space Exploration",
    "🍣 Foodie",
    "📷 Photography",
    "🏄‍♂️ Surfing",
    "🎻 Playing Instruments",
    "🧩 Puzzles",
    "🎨 Drawing",
    "🐱‍🏍 Extreme Sports",
    "📰 News",
    "🛠️ DIY Projects"
  ];

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
          interests.length,
          (index) => InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  setState(() {
                    if (selectedInterests.contains(interests[index])) {
                      selectedInterests.remove(interests[index]);
                    } else {
                      selectedInterests.add(interests[index]);
                    }
                  });
                },
                child: SelectWidget(
                    title: interests[index],
                    isSelected: selectedInterests.contains(interests[index])),
              )),
    );
  }
}

class SelectWidget extends StatelessWidget {
  final String title;
  final bool isSelected;

  const SelectWidget(
      {super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1,
                color:
                    isSelected ? Colors.black.withOpacity(0.6) : Colors.grey),
            color: isSelected
                ? const Color(0xFF3139E3).withOpacity(0.1)
                : Colors.white),
        child: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ));
  }
}
