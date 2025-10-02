import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/skill_compare_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'bottom_mission_is_locked_widget.dart' show BottomMissionIsLockedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomMissionIsLockedModel
    extends FlutterFlowModel<BottomMissionIsLockedWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonBlue widget.
  List<ViewUsersRow>? viewUsers;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonBlue widget.
  List<ViewUsersRow>? viewUsers2;

  @override
  void initState(BuildContext context) {
    buttonBlueModel1 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel2 = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    buttonBlueModel1.dispose();
    buttonBlueModel2.dispose();
  }
}
