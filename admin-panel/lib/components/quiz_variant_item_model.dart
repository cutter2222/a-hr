import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_variant_item_widget.dart' show QuizVariantItemWidget;
import 'package:flutter/material.dart';

class QuizVariantItemModel extends FlutterFlowModel<QuizVariantItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for VariantInput widget.
  FocusNode? variantInputFocusNode;
  TextEditingController? variantInputTextController;
  String? Function(BuildContext, String?)? variantInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    variantInputFocusNode?.dispose();
    variantInputTextController?.dispose();
  }
}
