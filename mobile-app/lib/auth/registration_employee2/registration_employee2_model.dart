import '/components/button_blue_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'registration_employee2_widget.dart' show RegistrationEmployee2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationEmployee2Model
    extends FlutterFlowModel<RegistrationEmployee2Widget> {
  ///  Local state fields for this page.

  bool showButton = false;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 10000;
  int timerMilliseconds = 10000;
  String timerValue = StopWatchTimer.getDisplayTime(
    10000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    timerController.dispose();
    buttonBlueModel.dispose();
  }
}
