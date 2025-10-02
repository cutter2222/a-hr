import '/components/list_item/list_item_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for ListItem component.
  late ListItemModel listItemModel1;
  // Model for ListItem component.
  late ListItemModel listItemModel2;
  // Model for ListItem component.
  late ListItemModel listItemModel3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? dialogOutput;
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    listItemModel1 = createModel(context, () => ListItemModel());
    listItemModel2 = createModel(context, () => ListItemModel());
    listItemModel3 = createModel(context, () => ListItemModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    listItemModel1.dispose();
    listItemModel2.dispose();
    listItemModel3.dispose();
    navbarMobileModel.dispose();
  }

  /// Action blocks.
  Future usersPagination(BuildContext context) async {}
}
