import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choose_item_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'registration3_widget.dart' show Registration3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registration3Model extends FlutterFlowModel<Registration3Widget> {
  ///  Local state fields for this page.

  UserRole? role;

  ///  State fields for stateful widgets in this page.

  // Model for Message component.
  late MessageModel messageModel;
  // Model for ChooseItem component.
  late ChooseItemModel chooseItemModel1;
  // Model for ChooseItem component.
  late ChooseItemModel chooseItemModel2;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel1;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel2;

  @override
  void initState(BuildContext context) {
    messageModel = createModel(context, () => MessageModel());
    chooseItemModel1 = createModel(context, () => ChooseItemModel());
    chooseItemModel2 = createModel(context, () => ChooseItemModel());
    buttonBlueModel1 = createModel(context, () => ButtonBlueModel());
    buttonBlueModel2 = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    messageModel.dispose();
    chooseItemModel1.dispose();
    chooseItemModel2.dispose();
    buttonBlueModel1.dispose();
    buttonBlueModel2.dispose();
  }
}
