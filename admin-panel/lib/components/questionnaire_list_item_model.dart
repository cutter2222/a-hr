import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'questionnaire_list_item_widget.dart' show QuestionnaireListItemWidget;
import 'package:flutter/material.dart';

class QuestionnaireListItemModel
    extends FlutterFlowModel<QuestionnaireListItemWidget> {
  ///  Local state fields for this component.

  MissionQuestionnaireDataStruct? questionnaireData;
  void updateQuestionnaireDataStruct(
      Function(MissionQuestionnaireDataStruct) updateFn) {
    updateFn(questionnaireData ??= MissionQuestionnaireDataStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for QuestionInput widget.
  FocusNode? questionInputFocusNode;
  TextEditingController? questionInputTextController;
  String? Function(BuildContext, String?)? questionInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionInputFocusNode?.dispose();
    questionInputTextController?.dispose();
  }

  /// Action blocks.
  Future isValidate(BuildContext context) async {
    if ((questionnaireData!.answers.isNotEmpty) &&
        (questionnaireData?.question != null &&
            questionnaireData?.question != '')) {
      updateQuestionnaireDataStruct(
        (e) => e..isValidated = true,
      );
    } else {
      updateQuestionnaireDataStruct(
        (e) => e..isValidated = true,
      );
    }
  }
}
