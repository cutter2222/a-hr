import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/mission_form_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'mission_form_widget.dart' show MissionFormWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionFormModel extends FlutterFlowModel<MissionFormWidget> {
  ///  Local state fields for this page.

  MissionFormStruct? missionForm;
  void updateMissionFormStruct(Function(MissionFormStruct) updateFn) {
    updateFn(missionForm ??= MissionFormStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    buttonBlueModel.dispose();
  }
}
