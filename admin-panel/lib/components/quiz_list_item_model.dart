import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_list_item_widget.dart' show QuizListItemWidget;
import 'package:flutter/material.dart';

class QuizListItemModel extends FlutterFlowModel<QuizListItemWidget> {
  ///  Local state fields for this component.

  MissionQuizDataStruct? quizData;
  void updateQuizDataStruct(Function(MissionQuizDataStruct) updateFn) {
    updateFn(quizData ??= MissionQuizDataStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for QuestionInput widget.
  FocusNode? questionInputFocusNode;
  TextEditingController? questionInputTextController;
  String? Function(BuildContext, String?)? questionInputTextControllerValidator;
  // State field(s) for CorrectAnswerInput widget.
  FocusNode? correctAnswerInputFocusNode;
  TextEditingController? correctAnswerInputTextController;
  String? Function(BuildContext, String?)?
      correctAnswerInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionInputFocusNode?.dispose();
    questionInputTextController?.dispose();

    correctAnswerInputFocusNode?.dispose();
    correctAnswerInputTextController?.dispose();
  }

  /// Action blocks.
  Future isValidate(BuildContext context) async {
    if ((quizData?.question != null && quizData?.question != '') &&
        (widget!.quizDataItem!.answers.isNotEmpty) &&
        (quizData?.correctAnswer != null && quizData?.correctAnswer != '')) {
      updateQuizDataStruct(
        (e) => e..isValidated = true,
      );
    } else {
      updateQuizDataStruct(
        (e) => e..isValidated = false,
      );
    }
  }
}
