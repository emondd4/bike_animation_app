import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SwipeCard extends StatefulWidget {
  final String title;
  final String image;
  final String power;
  final bool isActive;
  final bool fromBack;

  const SwipeCard({super.key,  required this.title, required this.image, required this.power, required this.isActive, required this.fromBack});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFDEDEDE),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 350,
            height: 220,
            child: Visibility(
              visible: widget.isActive,
              child: Image.network(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          )
              .animate(target: 1)
          .scaleXY(end: 0.9, delay: 200.ms, duration: 500.ms).then(delay: 200.ms)
          .scaleXY(end: 1.2, delay: 200.ms, duration: 500.ms),
          // // car will come form left or right
          //     .moveX(
          //     begin: widget.fromBack ? -300 : 300,
          //     delay: 110.ms,
          //     duration: 250.ms,
          //     curve: Curves.easeOutCirc)
          //     .then(delay: 600.ms)
          // // then move car forward
          //     .moveX(end: 100)
          //     .then()
          // // then zoom in 2x
          //     .scaleXY(end: 2, delay: 200.ms, duration: 1000.ms)
          //     .then()
          // // then move while zoomed in 2x
          //     .moveX(end: -400, duration: 2000.ms)
          //     .then()
          // // then zoomed view end zoom out back to original size
          //     .scaleXY(end: 0.5, delay: 300.ms, duration: 500.ms)
          //     .then()
          //     .moveX(end: 100, duration: 1000.ms),
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.grey.shade100,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("DUCATI ${widget.title}",
                  maxLines: 1,
                  style: const TextStyle(
                    letterSpacing: 2,
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.power,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
