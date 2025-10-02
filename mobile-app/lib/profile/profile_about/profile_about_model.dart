import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_about_widget.dart' show ProfileAboutWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileAboutModel extends FlutterFlowModel<ProfileAboutWidget> {
  ///  Local state fields for this page.

  DateTime? birthDate;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
  }
}
