import '/components/button_blue_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'page_info_widget.dart' show PageInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageInfoModel extends FlutterFlowModel<PageInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Message component.
  late MessageModel messageModel;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    buttonBlueModel.dispose();
  }
}
