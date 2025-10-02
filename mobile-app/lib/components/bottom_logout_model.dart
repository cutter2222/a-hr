import '/components/button_blue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'bottom_logout_widget.dart' show BottomLogoutWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomLogoutModel extends FlutterFlowModel<BottomLogoutWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;

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
