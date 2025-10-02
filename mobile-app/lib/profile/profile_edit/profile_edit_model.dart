import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/date_picker_widget.dart';
import '/components/photo_add_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  Local state fields for this page.

  DateTime? birthDate;

  String? gender;

  String? photoUrl;

  ///  State fields for stateful widgets in this page.

  // Model for PhotoAdd component.
  late PhotoAddModel photoAddModel;
  // State field(s) for FirstNameInput widget.
  FocusNode? firstNameInputFocusNode;
  TextEditingController? firstNameInputTextController;
  String? Function(BuildContext, String?)?
      firstNameInputTextControllerValidator;
  // State field(s) for LastNameInput widget.
  FocusNode? lastNameInputFocusNode;
  TextEditingController? lastNameInputTextController;
  String? Function(BuildContext, String?)? lastNameInputTextControllerValidator;
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  // State field(s) for AboutMeInput widget.
  FocusNode? aboutMeInputFocusNode;
  TextEditingController? aboutMeInputTextController;
  String? Function(BuildContext, String?)? aboutMeInputTextControllerValidator;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    photoAddModel = createModel(context, () => PhotoAddModel());
    datePickerModel = createModel(context, () => DatePickerModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    photoAddModel.dispose();
    firstNameInputFocusNode?.dispose();
    firstNameInputTextController?.dispose();

    lastNameInputFocusNode?.dispose();
    lastNameInputTextController?.dispose();

    datePickerModel.dispose();
    nicknameInputFocusNode?.dispose();
    nicknameInputTextController?.dispose();

    aboutMeInputFocusNode?.dispose();
    aboutMeInputTextController?.dispose();

    buttonBlueModel.dispose();
  }
}
