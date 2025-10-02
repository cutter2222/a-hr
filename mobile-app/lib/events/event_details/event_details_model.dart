import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/event_user_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'event_details_widget.dart' show EventDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventDetailsModel extends FlutterFlowModel<EventDetailsWidget> {
  ///  Local state fields for this page.

  ViewMissionsRow? viewMissions;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<EventsRow>? queryEvents;
  // Model for BorderedContainer component.
  late BorderedContainerModel borderedContainerModel1;
  // Model for BorderedContainer component.
  late BorderedContainerModel borderedContainerModel2;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel3;

  @override
  void initState(BuildContext context) {
    borderedContainerModel1 =
        createModel(context, () => BorderedContainerModel());
    borderedContainerModel2 =
        createModel(context, () => BorderedContainerModel());
    buttonBlueModel1 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel2 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel3 = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    borderedContainerModel1.dispose();
    borderedContainerModel2.dispose();
    buttonBlueModel1.dispose();
    buttonBlueModel2.dispose();
    buttonBlueModel3.dispose();
  }
}
