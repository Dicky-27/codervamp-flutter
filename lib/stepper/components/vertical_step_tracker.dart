import 'package:flutter/material.dart';

enum TrackerState {
  prev,
  current,
}

class VerticalStepTracker extends StatelessWidget {
  const VerticalStepTracker(
      {super.key,
      required this.steps,
      this.dotSize = 10,
      this.circleSize = 24,
      this.pipeSize = 30.0,
      this.currentColor = Colors.green})
      : assert(dotSize <= 20),
        assert(pipeSize >= 25);

  final List<CustomStep> steps;
  final double dotSize;
  final double circleSize;
  final double pipeSize;
  final Color currentColor;

  Color _circleColor(int index) {
    TrackerState state = steps[index].state;
    switch (state) {
      case TrackerState.current:
        return currentColor;
      case TrackerState.prev:
        return Colors.white.withOpacity(0.5);
    }
  }

  Widget _buildDot(int index) {
    return ClipOval(
      child: ClipOval(
          child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(color: _circleColor(index)),
      )),
    );
  }

  Widget _buildDotVerticalHeader(int index) => Row(
        children: [
          steps[index].time != null
              ? SizedBox(
                  width: 42,
                  child: Text(
                    "${steps[index].time}",
                    maxLines: 2,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        color: steps[index].state == TrackerState.current
                            ? Colors.white
                            : Colors.white.withOpacity(0.5)),
                  ))
              : const SizedBox(),
          const SizedBox(width: 10),
          _buildDot(index),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps[index].title,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: steps[index].state == TrackerState.current
                          ? currentColor
                          : Colors.white.withOpacity(0.5)),
                ),
                steps[index].description != null
                    ? Text(
                        "${steps[index].description}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: steps[index].state == TrackerState.current
                                ? currentColor
                                : Colors.white.withOpacity(0.5)),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      );

  Widget _buildDotVertical() => ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
            child: _buildDotVerticalHeader(index),
          ),
      separatorBuilder: (context, index) => Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: pipeSize,
              margin: EdgeInsets.only(left: dotSize / 2.2 + 52),
              child: VerticalDivider(
                  thickness: 1.5,
                  width: 1,
                  color: Colors.white.withOpacity(0.5)))),
      itemCount: steps.length);

  @override
  Widget build(BuildContext context) {
    return _buildDotVertical();
  }
}

class CustomStep {
  const CustomStep({
    Key? key,
    required this.title,
    this.time,
    this.description,
    this.state = TrackerState.prev,
  });

  final String title;
  final String? time;
  final TrackerState state;
  final String? description;
}
