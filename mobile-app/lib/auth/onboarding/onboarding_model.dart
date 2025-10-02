import '/components/button_blue_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  double initialTurns = 0.0;

  double finalTurns = 0.3;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageViewText widget.
  PageController? pageViewTextController;

  int get pageViewTextCurrentIndex => pageViewTextController != null &&
          pageViewTextController!.hasClients &&
          pageViewTextController!.page != null
      ? pageViewTextController!.page!.round()
      : 0;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;

  @override
  void initState(BuildContext context) {
    buttonBlueModel1 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel2 = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    buttonBlueModel1.dispose();
    buttonBlueModel2.dispose();
  }
}
