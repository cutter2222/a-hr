import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/date_picker_widget.dart';
import '/components/message_widget.dart';
import '/components/photo_add_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'registration_employee1_widget.dart' show RegistrationEmployee1Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationEmployee1Model
    extends FlutterFlowModel<RegistrationEmployee1Widget> {
  ///  Local state fields for this page.

  DateTime? companyStartDate;

  String? imagePath;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;
  // Model for PhotoAdd component.
  late PhotoAddModel photoAddModel;
  // State field(s) for CompanyNameInput widget.
  FocusNode? companyNameInputFocusNode;
  TextEditingController? companyNameInputTextController;
  String? Function(BuildContext, String?)?
      companyNameInputTextControllerValidator;
  // State field(s) for CompanyPositionInput widget.
  FocusNode? companyPositionInputFocusNode;
  TextEditingController? companyPositionInputTextController;
  String? Function(BuildContext, String?)?
      companyPositionInputTextControllerValidator;
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    photoAddModel = createModel(context, () => PhotoAddModel());
    datePickerModel = createModel(context, () => DatePickerModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    photoAddModel.dispose();
    companyNameInputFocusNode?.dispose();
    companyNameInputTextController?.dispose();

    companyPositionInputFocusNode?.dispose();
    companyPositionInputTextController?.dispose();

    datePickerModel.dispose();
    buttonBlueModel.dispose();
  }
}
