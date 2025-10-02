import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_quiz_add_widget.dart' show DialogQuizAddWidget;
import 'package:flutter/material.dart';

class DialogQuizAddModel extends FlutterFlowModel<DialogQuizAddWidget> {
  ///  Local state fields for this component.

  MissionQuizStruct? missionQuiz;
  void updateMissionQuizStruct(Function(MissionQuizStruct) updateFn) {
    updateFn(missionQuiz ??= MissionQuizStruct());
  }

  bool isValidate = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
