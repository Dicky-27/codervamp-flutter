import 'package:flutter/material.dart';

class NeuDecoration extends BoxDecoration {
  NeuDecoration()
      : super(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        );
}

class PlayNeuDecoration extends BoxDecoration {
  PlayNeuDecoration()
      : super(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            border: Border.all(
              color: const Color(0xFF87A7FD),
              width: 10.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ]);
}
