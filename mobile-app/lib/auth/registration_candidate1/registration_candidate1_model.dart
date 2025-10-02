import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/circle_button_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'registration_candidate1_widget.dart' show RegistrationCandidate1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationCandidate1Model
    extends FlutterFlowModel<RegistrationCandidate1Widget> {
  ///  Local state fields for this page.

  int? option;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;
  // Model for CircleButton component.
  late CircleButtonModel circleButtonModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    circleButtonModel = createModel(context, () => CircleButtonModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    circleButtonModel.dispose();
  }
}
