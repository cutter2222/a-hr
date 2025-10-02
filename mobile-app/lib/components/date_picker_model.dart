import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'date_picker_widget.dart' show DatePickerWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DatePickerModel extends FlutterFlowModel<DatePickerWidget> {
  ///  Local state fields for this component.

  bool isActive = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - showDatePicker] action in Container widget.
  DateTime? datePicker;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
