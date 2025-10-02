import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/date_picker_widget.dart';
import '/components/event_user_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'event_add_widget.dart' show EventAddWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventAddModel extends FlutterFlowModel<EventAddWidget> {
  ///  Local state fields for this page.

  bool isOpen = true;

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for DescriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;
  // State field(s) for LocationInput widget.
  FocusNode? locationInputFocusNode;
  TextEditingController? locationInputTextController;
  String? Function(BuildContext, String?)? locationInputTextControllerValidator;
  // Model for StartDatePicker.
  late DatePickerModel startDatePickerModel;
  // State field(s) for MinUsersInput widget.
  FocusNode? minUsersInputFocusNode;
  TextEditingController? minUsersInputTextController;
  String? Function(BuildContext, String?)? minUsersInputTextControllerValidator;
  // State field(s) for MaxUsersInput widget.
  FocusNode? maxUsersInputFocusNode;
  TextEditingController? maxUsersInputTextController;
  String? Function(BuildContext, String?)? maxUsersInputTextControllerValidator;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    startDatePickerModel = createModel(context, () => DatePickerModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    descriptionInputFocusNode?.dispose();
    descriptionInputTextController?.dispose();

    locationInputFocusNode?.dispose();
    locationInputTextController?.dispose();

    startDatePickerModel.dispose();
    minUsersInputFocusNode?.dispose();
    minUsersInputTextController?.dispose();

    maxUsersInputFocusNode?.dispose();
    maxUsersInputTextController?.dispose();

    buttonBlueModel.dispose();
  }
}
