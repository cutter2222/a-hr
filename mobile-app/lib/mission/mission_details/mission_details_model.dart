import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/bottom_mission_is_locked_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/home_reward_row_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'mission_details_widget.dart' show MissionDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionDetailsModel extends FlutterFlowModel<MissionDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BorderedContainer component.
  late BorderedContainerModel borderedContainerModel1;
  // Model for BorderedContainer component.
  late BorderedContainerModel borderedContainerModel2;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Stores action output result for [Custom Action - callAutocheckFunction] action in ButtonBlue widget.
  String? callAutoCheckFunction;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;

  @override
  void initState(BuildContext context) {
    borderedContainerModel1 =
        createModel(context, () => BorderedContainerModel());
    borderedContainerModel2 =
        createModel(context, () => BorderedContainerModel());
    buttonBlueModel1 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel2 = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    borderedContainerModel1.dispose();
    borderedContainerModel2.dispose();
    buttonBlueModel1.dispose();
    buttonBlueModel2.dispose();
  }

  /// Action blocks.
  Future takeMission(BuildContext context) async {}
}
