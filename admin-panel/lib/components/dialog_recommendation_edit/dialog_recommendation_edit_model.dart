import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_recommendation_edit_widget.dart'
    show DialogRecommendationEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DialogRecommendationEditModel
    extends FlutterFlowModel<DialogRecommendationEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SortInput widget.
  FocusNode? sortInputFocusNode;
  TextEditingController? sortInputTextController;
  late MaskTextInputFormatter sortInputMask;
  String? Function(BuildContext, String?)? sortInputTextControllerValidator;
  // State field(s) for TitleInput widget.
  FocusNode? titleInputFocusNode;
  TextEditingController? titleInputTextController;
  String? Function(BuildContext, String?)? titleInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sortInputFocusNode?.dispose();
    sortInputTextController?.dispose();

    titleInputFocusNode?.dispose();
    titleInputTextController?.dispose();
  }
}
