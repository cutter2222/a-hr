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
import 'mission_questionnaire_widget.dart' show MissionQuestionnaireWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionQuestionnaireModel
    extends FlutterFlowModel<MissionQuestionnaireWidget> {
  ///  Local state fields for this page.

  MissionQuestionnaireStruct? missionQuestionnaire;
  void updateMissionQuestionnaireStruct(
      Function(MissionQuestionnaireStruct) updateFn) {
    updateFn(missionQuestionnaire ??= MissionQuestionnaireStruct());
  }

  int index = 0;

  MissionQuestionnaireDataStruct? currentQuestion;
  void updateCurrentQuestionStruct(
      Function(MissionQuestionnaireDataStruct) updateFn) {
    updateFn(currentQuestion ??= MissionQuestionnaireDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for ProgressBar component.
  late ProgressBarModel progressBarModel;
  // Model for ButtonNext.
  late ButtonBlueModel buttonNextModel;
  // Model for ButtonComplete.
  late ButtonBlueModel buttonCompleteModel;

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
