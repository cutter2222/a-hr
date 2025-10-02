import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mission_form_item_widget.dart' show MissionFormItemWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionFormItemModel extends FlutterFlowModel<MissionFormItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FieldInput widget.
  FocusNode? fieldInputFocusNode;
  TextEditingController? fieldInputTextController;
  String? Function(BuildContext, String?)? fieldInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fieldInputFocusNode?.dispose();
    fieldInputTextController?.dispose();
  }
}
