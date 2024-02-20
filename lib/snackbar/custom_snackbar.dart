import 'package:codervamp/glassmorphism/components/frostedglassbox.dart';
import 'package:flutter/material.dart';

class CustomSnackbar extends StatefulWidget {
  const CustomSnackbar({super.key});

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
  void showSnackBar(BuildContext context, [bool isTop = true]) {
    final snackBar = SnackBar(
      elevation: 0,
      content: const FrostedGlassBoxWidget(
          width: double.maxFinite,
          height: 50,
          borderRadius: 11,
          child: Text(
            "📢 Yay! A SnackBar!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          )),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      dismissDirection: isTop ? DismissDirection.up : DismissDirection.down,
      margin: EdgeInsets.only(
          bottom: isTop ? MediaQuery.of(context).size.height - 160 : 10,
          left: 10,
          right: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.teal],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showSnackBar(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Show top snackbar',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showSnackBar(context, false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Show bottom snackbar',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
