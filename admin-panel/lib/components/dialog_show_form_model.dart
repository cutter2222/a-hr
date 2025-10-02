import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_show_form_widget.dart' show DialogShowFormWidget;
import 'package:flutter/material.dart';

class DialogShowFormModel extends FlutterFlowModel<DialogShowFormWidget> {
  ///  Local state fields for this component.

  MissionFormStruct? missionForm;
  void updateMissionFormStruct(Function(MissionFormStruct) updateFn) {
    updateFn(missionForm ??= MissionFormStruct());
  }

  dynamic json;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
