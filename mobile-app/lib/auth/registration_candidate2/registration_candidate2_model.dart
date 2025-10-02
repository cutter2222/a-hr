import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/message_widget.dart';
import '/components/photo_add_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'registration_candidate2_widget.dart' show RegistrationCandidate2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationCandidate2Model
    extends FlutterFlowModel<RegistrationCandidate2Widget> {
  ///  Local state fields for this page.

  String? imagePath;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;
  // Model for PhotoAdd component.
  late PhotoAddModel photoAddModel;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    photoAddModel = createModel(context, () => PhotoAddModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    photoAddModel.dispose();
    buttonBlueModel.dispose();
  }
}
