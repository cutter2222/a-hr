import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'profile_resume_widget.dart' show ProfileResumeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileResumeModel extends FlutterFlowModel<ProfileResumeWidget> {
  ///  Local state fields for this page.

  DateTime? birthDate;

  String? gender;

  String? photoUrl;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CityInput widget.
  FocusNode? cityInputFocusNode;
  TextEditingController? cityInputTextController;
  String? Function(BuildContext, String?)? cityInputTextControllerValidator;
  // State field(s) for EducationInput widget.
  FocusNode? educationInputFocusNode;
  TextEditingController? educationInputTextController;
  String? Function(BuildContext, String?)?
      educationInputTextControllerValidator;
  // State field(s) for TrainingInput widget.
  FocusNode? trainingInputFocusNode;
  TextEditingController? trainingInputTextController;
  String? Function(BuildContext, String?)? trainingInputTextControllerValidator;
  // State field(s) for WorkedInput widget.
  FocusNode? workedInputFocusNode;
  TextEditingController? workedInputTextController;
  String? Function(BuildContext, String?)? workedInputTextControllerValidator;
  // State field(s) for HobbyInput widget.
  FocusNode? hobbyInputFocusNode;
  TextEditingController? hobbyInputTextController;
  String? Function(BuildContext, String?)? hobbyInputTextControllerValidator;
  // State field(s) for QualitiesInput widget.
  FocusNode? qualitiesInputFocusNode;
  TextEditingController? qualitiesInputTextController;
  String? Function(BuildContext, String?)?
      qualitiesInputTextControllerValidator;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    cityInputFocusNode?.dispose();
    cityInputTextController?.dispose();

    educationInputFocusNode?.dispose();
    educationInputTextController?.dispose();

    trainingInputFocusNode?.dispose();
    trainingInputTextController?.dispose();

    workedInputFocusNode?.dispose();
    workedInputTextController?.dispose();

    hobbyInputFocusNode?.dispose();
    hobbyInputTextController?.dispose();

    qualitiesInputFocusNode?.dispose();
    qualitiesInputTextController?.dispose();

    buttonBlueModel.dispose();
  }
}
