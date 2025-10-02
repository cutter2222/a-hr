import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_show_quiz_widget.dart' show DialogShowQuizWidget;
import 'package:flutter/material.dart';

class DialogShowQuizModel extends FlutterFlowModel<DialogShowQuizWidget> {
  ///  Local state fields for this component.

  MissionQuizStruct? missionQuiz;
  void updateMissionQuizStruct(Function(MissionQuizStruct) updateFn) {
    updateFn(missionQuiz ??= MissionQuizStruct());
  }

  dynamic json;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
