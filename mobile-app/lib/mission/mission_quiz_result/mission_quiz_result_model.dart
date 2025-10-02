import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_quiz_container_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'mission_quiz_result_widget.dart' show MissionQuizResultWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionQuizResultModel extends FlutterFlowModel<MissionQuizResultWidget> {
  ///  Local state fields for this page.

  MissionQuizStruct? quiz;
  void updateQuizStruct(Function(MissionQuizStruct) updateFn) {
    updateFn(quiz ??= MissionQuizStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
