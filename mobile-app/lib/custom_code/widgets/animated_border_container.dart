// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;
import 'package:flutter/animation.dart';

class AnimatedBorderContainer extends StatefulWidget {
  const AnimatedBorderContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.index,
    this.color1,
    this.color2,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final int? index;
  final Color? color1;
  final Color? color2;

  @override
  State<AnimatedBorderContainer> createState() =>
      _AnimatedBorderContainerState();
}

class _AnimatedBorderContainerState extends State<AnimatedBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double phaseShift; // Declare phaseShift as a class field

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6), // Moderate speed for rotation
      vsync: this,
    )..repeat();

    // Apply a phase shift based on index to create a cascading effect
    phaseShift =
        widget.index != null ? (widget.index! * 0.2) % (2 * math.pi) : 0.0;
    _animation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            boxShadow: [
              BoxShadow(
                color: (widget.color1 ?? Colors.blue)
                    .withOpacity(0.3), // Static glow color
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: CustomPaint(
            painter: _AnimatedGradientPainter(
              animationValue: _animation.value + phaseShift,
              color1: widget.color1 ?? Colors.blue,
              color2: widget.color2 ?? Colors.purple,
              borderRadius: widget.borderRadius ?? 8,
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedGradientPainter extends CustomPainter {
  final double animationValue;
  final Color color1;
  final Color color2;
  final double borderRadius;

  _AnimatedGradientPainter({
    required this.animationValue,
    required this.color1,
    required this.color2,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final paint = Paint()
      ..shader = SweepGradient(
        colors: [color1, color2, color1], // Minimal cycle for seamless loop
        stops: const [0.0, 0.5, 1.0], // Evenly spaced for smooth transition
        transform: GradientRotation(animationValue),
      ).createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
