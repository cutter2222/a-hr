import '/components/navbar_menu_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'navbar_widget.dart' show NavbarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NavbarMenuItem component.
  late NavbarMenuItemModel navbarMenuItemModel1;
  // Model for NavbarMenuItem component.
  late NavbarMenuItemModel navbarMenuItemModel2;
  // Model for NavbarMenuItem component.
  late NavbarMenuItemModel navbarMenuItemModel3;
  // Model for NavbarMenuItem component.
  late NavbarMenuItemModel navbarMenuItemModel4;

  @override
  void initState(BuildContext context) {
    navbarMenuItemModel1 = createModel(context, () => NavbarMenuItemModel());
    navbarMenuItemModel2 = createModel(context, () => NavbarMenuItemModel());
    navbarMenuItemModel3 = createModel(context, () => NavbarMenuItemModel());
    navbarMenuItemModel4 = createModel(context, () => NavbarMenuItemModel());
  }

  @override
  void dispose() {
    navbarMenuItemModel1.dispose();
    navbarMenuItemModel2.dispose();
    navbarMenuItemModel3.dispose();
    navbarMenuItemModel4.dispose();
  }
}
