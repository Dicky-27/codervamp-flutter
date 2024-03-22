import 'package:codervamp/widgets/selections/multi_select/components/multi_select_widget.dart';
import 'package:flutter/material.dart';

class MultiSelectPage extends StatelessWidget {
  const MultiSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Let's select your interests.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                "Please select two or more to proceed.",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const MultiSelectWidget(),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3139E3),
                    shape: const StadiumBorder(),
                    minimumSize: const Size.fromHeight(50),
                    elevation: 0),
                onPressed: () {},
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              )
            ],
          )),
    );
  }
}
