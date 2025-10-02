import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_questionnaire_add_widget.dart' show DialogQuestionnaireAddWidget;
import 'package:flutter/material.dart';

class DialogQuestionnaireAddModel
    extends FlutterFlowModel<DialogQuestionnaireAddWidget> {
  ///  Local state fields for this component.

  MissionQuestionnaireStruct? missionQuestionnaire;
  void updateMissionQuestionnaireStruct(
      Function(MissionQuestionnaireStruct) updateFn) {
    updateFn(missionQuestionnaire ??= MissionQuestionnaireStruct());
  }

  bool isValidate = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
