import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_form_add_widget.dart' show DialogFormAddWidget;
import 'package:flutter/material.dart';

class DialogFormAddModel extends FlutterFlowModel<DialogFormAddWidget> {
  ///  Local state fields for this component.

  MissionFormStruct? missionForm;
  void updateMissionFormStruct(Function(MissionFormStruct) updateFn) {
    updateFn(missionForm ??= MissionFormStruct());
  }

  bool isValidate = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TitleInput widget.
  FocusNode? titleInputFocusNode;
  TextEditingController? titleInputTextController;
  String? Function(BuildContext, String?)? titleInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleInputFocusNode?.dispose();
    titleInputTextController?.dispose();
  }
}
