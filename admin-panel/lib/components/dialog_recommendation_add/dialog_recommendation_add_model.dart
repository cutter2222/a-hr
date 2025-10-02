import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_recommendation_add_widget.dart'
    show DialogRecommendationAddWidget;
import 'package:flutter/material.dart';

class DialogRecommendationAddModel
    extends FlutterFlowModel<DialogRecommendationAddWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for InputName widget.
  FocusNode? inputNameFocusNode;
  TextEditingController? inputNameTextController;
  String? Function(BuildContext, String?)? inputNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNameFocusNode?.dispose();
    inputNameTextController?.dispose();
  }
}
