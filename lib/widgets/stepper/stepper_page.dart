import 'package:codervamp/widgets/stepper/components/vertical_step_tracker.dart';
import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class StepperPage extends StatelessWidget {
  const StepperPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomStep> steps = const [
      CustomStep(
          state: TrackerState.current,
          title: "Delivery",
          time: "Feb 16 05:00",
          description: "Your order is on its way to you."),
      CustomStep(
          state: TrackerState.prev,
          title: "Shipped",
          time: "Feb 14 08:00",
          description: "Your order has been shipped."),
      CustomStep(
          state: TrackerState.prev,
          title: "Processing",
          time: "Feb 13 09:00",
          description: "Your order is being processed."),
      CustomStep(
          state: TrackerState.prev,
          title: "Order Confirmed",
          time: "Feb 12 12:30",
          description: "Your order is confirmed and being prepared."),
      CustomStep(
          state: TrackerState.prev,
          title: "Order Placed",
          time: "Feb 12 12:00",
          description: "Your order has been successfully placed."),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Status",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF24243E),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
          ),
        ),
        child: Column(
          children: [
            Lottie.asset(Assets.LOTTIE_DELIVERY,
                width: double.maxFinite, fit: BoxFit.contain),
            VerticalStepTracker(
              steps: steps,
              currentColor: Colors.cyanAccent,
            ),
          ],
        ),
      ),
    );
  }
}
