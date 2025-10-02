import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_show_questionnaire_widget.dart'
    show DialogShowQuestionnaireWidget;
import 'package:flutter/material.dart';

class DialogShowQuestionnaireModel
    extends FlutterFlowModel<DialogShowQuestionnaireWidget> {
  ///  Local state fields for this component.

  MissionQuestionnaireStruct? missionQuestionnaire;
  void updateMissionQuestionnaireStruct(
      Function(MissionQuestionnaireStruct) updateFn) {
    updateFn(missionQuestionnaire ??= MissionQuestionnaireStruct());
  }

  dynamic json;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
