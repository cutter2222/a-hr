import '/flutter_flow/flutter_flow_util.dart';
import 'mission_required_skill_item_widget.dart'
    show MissionRequiredSkillItemWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MissionRequiredSkillItemModel
    extends FlutterFlowModel<MissionRequiredSkillItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SkillPoints widget.
  FocusNode? skillPointsFocusNode;
  TextEditingController? skillPointsTextController;
  late MaskTextInputFormatter skillPointsMask;
  String? Function(BuildContext, String?)? skillPointsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    skillPointsFocusNode?.dispose();
    skillPointsTextController?.dispose();
  }
}
