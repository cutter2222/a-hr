import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'progress_bar_model.dart';
export 'progress_bar_model.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    super.key,
    this.fact,
    this.plan,
    this.padding,
  });

  final double? fact;
  final double? plan;
  final int? padding;

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget>
    with TickerProviderStateMixin {
  late ProgressBarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 3000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: double.infinity,
        height: 12.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.elasticOut,
            width: valueOrDefault<double>(
              functions.customProgressbarWidget(
                  valueOrDefault<double>(
                    widget!.plan,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    widget!.fact,
                    0.0,
                  ),
                  MediaQuery.sizeOf(context).width,
                  widget!.padding),
              55.0,
            ),
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFA604F9),
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(1.0, 0.0),
                end: AlignmentDirectional(-1.0, 0),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
