import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_quiz_container_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'mission_quiz_widget.dart' show MissionQuizWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionQuizModel extends FlutterFlowModel<MissionQuizWidget> {
  ///  Local state fields for this page.

  MissionQuizStruct? quiz;
  void updateQuizStruct(Function(MissionQuizStruct) updateFn) {
    updateFn(quiz ??= MissionQuizStruct());
  }

  int index = 0;

  MissionQuizDataStruct? currentQuestion;
  void updateCurrentQuestionStruct(Function(MissionQuizDataStruct) updateFn) {
    updateFn(currentQuestion ??= MissionQuizDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for ProgressBar component.
  late ProgressBarModel progressBarModel;
  // Model for ButtonNext.
  late ButtonBlueModel buttonNextModel;
  // Model for ButtonComplete.
  late ButtonBlueModel buttonCompleteModel;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonComplete widget.
  UserMissionsRow? insertUserMissions;

  @override
  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
    buttonNextModel = createModel(context, () => ButtonBlueModel());
    buttonCompleteModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    progressBarModel.dispose();
    buttonNextModel.dispose();
    buttonCompleteModel.dispose();
  }
}
