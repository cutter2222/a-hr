import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose2_widget.dart';
import '/components/message_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'mission_archive_widget.dart' show MissionArchiveWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionArchiveModel extends FlutterFlowModel<MissionArchiveWidget> {
  ///  Local state fields for this page.

  String filter = 'Выполненные';

  ///  State fields for stateful widgets in this page.

  // Model for Choose2 component.
  late Choose2Model choose2Model;
  // Model for Message component.
  late MessageModel messageModel;

  @override
  void initState(BuildContext context) {
    choose2Model = createModel(context, () => Choose2Model());
    messageModel = createModel(context, () => MessageModel());
  }

  @override
  void dispose() {
    choose2Model.dispose();
    messageModel.dispose();
  }
}
