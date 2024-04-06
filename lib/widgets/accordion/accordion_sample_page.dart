import 'package:codervamp/widgets/accordion/components/accordion_widget.dart';
import 'package:flutter/material.dart';

final List<Map<String, String>> faqs = [
  {
    "question": "How to add an item to a list in Flutter?",
    "answer": "You can add an item to a list in Flutter using the add method."
  },
  {
    "question": "How to navigate to a new screen in Flutter?",
    "answer": "Use Navigator.push() to navigate to a new screen."
  },
  {
    "question": "How to manage state in a Flutter app?",
    "answer":
        "Flutter offers several ways to manage state, including Provider, Riverpod, Bloc, and setState for simpler use cases."
  },
  {
    "question": "How to use a database in Flutter?",
    "answer":
        "You can use SQLite directly or through a package like Moor or Hive for local storage. For cloud storage, Firebase is a popular choice."
  },
  {
    "question": "How to handle user input in Flutter?",
    "answer":
        "Use TextFormField for text input within a Form widget. For other inputs, consider using dedicated widgets like Checkbox, Switch, or Slider."
  },
  {
    "question": "How to perform HTTP requests in Flutter?",
    "answer":
        "Use the http package to make HTTP requests. For more advanced use cases, consider packages like Dio or Retrofit."
  },
  {
    "question": "How to implement dark mode in Flutter?",
    "answer":
        "Use ThemeData to define light and dark themes. Then, use MediaQuery to detect the system theme or allow users to select their preference."
  },
  {
    "question": "How to use custom fonts in Flutter?",
    "answer":
        "Add your font files to the project, then specify them in the pubspec.yaml under the fonts section. Apply them using the fontFamily property in your text styles."
  },
  {
    "question": "How to add animations in Flutter?",
    "answer":
        "Flutter has built-in widgets like AnimatedContainer and Hero for simple animations. For more complex animations, use the AnimationController with Tween."
  },
  {
    "question": "How to use themes in Flutter?",
    "answer":
        "Define a ThemeData instance and pass it to the theme property of MaterialApp. Customize properties like primarySwatch, accentColor, and textTheme."
  },
];

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[900],
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (BuildContext context, int index) {
          return AccordionWidget(
              title: faqs[index]['question'].toString(),
              desc: faqs[index]['answer'].toString());
        },
      ),
    );
  }
}
