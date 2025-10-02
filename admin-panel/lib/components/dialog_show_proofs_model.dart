import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_show_proofs_widget.dart' show DialogShowProofsWidget;
import 'package:flutter/material.dart';

class DialogShowProofsModel extends FlutterFlowModel<DialogShowProofsWidget> {
  ///  Local state fields for this component.

  MissionProofsStruct? missionProofs;
  void updateMissionProofsStruct(Function(MissionProofsStruct) updateFn) {
    updateFn(missionProofs ??= MissionProofsStruct());
  }

  dynamic json;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
