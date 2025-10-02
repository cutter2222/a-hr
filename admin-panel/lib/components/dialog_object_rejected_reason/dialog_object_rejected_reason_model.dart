import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_object_rejected_reason_widget.dart'
    show DialogObjectRejectedReasonWidget;
import 'package:flutter/material.dart';

class DialogObjectRejectedReasonModel
    extends FlutterFlowModel<DialogObjectRejectedReasonWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ReasonInput widget.
  FocusNode? reasonInputFocusNode;
  TextEditingController? reasonInputTextController;
  String? Function(BuildContext, String?)? reasonInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reasonInputFocusNode?.dispose();
    reasonInputTextController?.dispose();
  }
}
